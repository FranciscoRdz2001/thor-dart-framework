import 'dart:io';
import 'dart:async';

StreamController<String>? _reloadController;

void main() async {
  _reloadController = StreamController<String>.broadcast();

  await compileApp();

  // Servidor HTTP simple
  final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
  print('🌐 Server running on http://localhost:8080');
  print('📱 Auto-reload enabled - watching files...');

  // File watcher para hot reload
  setupFileWatcher();

  await for (HttpRequest request in server) {
    handleRequest(request);
  }
}

Future<void> compileApp() async {
  print('🔨 Compiling...');
  final compileResult = await Process.run('dart', [
    'compile',
    'js',
    'web/main.dart',
    '-o',
    'web/main.dart.js',
    '--minify',
    '--omit-implicit-checks',
    '-O4',
  ]);

  if (compileResult.exitCode != 0) {
    print('❌ Compilation failed:');
    print(compileResult.stderr);
    return;
  }

  final jsFile = File('web/main.dart.js');
  final sizeKB = (await jsFile.length()) / 1024;
  print('✅ Compiled (~${sizeKB.round()}KB)');

  // Notificar al navegador que recargue
  _reloadController?.add('reload');
}

void setupFileWatcher() {
  final webDir = Directory('web');
  bool isCompiling = false;

  if (webDir.existsSync()) {
    webDir.watch(recursive: true).listen((event) async {
      // Solo archivos .dart, ignorar .js, .map, etc.
      if (!event.path.endsWith('.dart')) return;

      // Evitar compilaciones simultáneas
      if (isCompiling) return;

      print('🔄 File changed: ${event.path}');
      isCompiling = true;
      await compileApp();
      isCompiling = false;
    });
  }
}

void handleRequest(HttpRequest request) async {
  try {
    final uri = request.uri;
    var path = uri.path == '/' ? '/index.html' : uri.path;

    // Server-Sent Events para auto-reload
    if (path == '/reload') {
      request.response.bufferOutput = false; // Deshabilitar buffering
      request.response.headers
        ..set('Content-Type', 'text/event-stream; charset=utf-8')
        ..set('Cache-Control', 'no-cache')
        ..set('Connection', 'keep-alive')
        ..set('Access-Control-Allow-Origin', '*');

      // Enviar comentario inicial para establecer conexión
      request.response.write(':ok\n\n');

      print('🔌 SSE client connected');

      // Escuchar eventos de reload
      final subscription = _reloadController!.stream.listen((event) {
        try {
          print('📡 Sending reload event to browser...');
          request.response.write('data: $event\n\n');
        } catch (e) {
          print('⚠️ Error sending SSE: $e');
        }
      });

      // Mantener conexión abierta hasta que el cliente se desconecte
      await request.response.done;
      print('🔌 SSE client disconnected');
      await subscription.cancel();
      return;
    }

    // Ignorar requests de DevTools
    if (path.contains('.well-known') || path.contains('chrome-extension')) {
      request.response.statusCode = HttpStatus.notFound;
      await request.response.close();
      return;
    }

    final mimeTypes = {
      '.html': 'text/html',
      '.js': 'application/javascript',
      '.css': 'text/css',
      '.map': 'application/json',
    };

    final file = File('web$path');

    if (await file.exists()) {
      final extension = path.substring(path.lastIndexOf('.'));
      final mimeType = mimeTypes[extension] ?? 'application/octet-stream';

      // Sin caché para desarrollo con hot reload
      request.response
        ..headers.contentType = ContentType.parse(mimeType)
        ..headers.set('Cache-Control', 'no-cache, no-store, must-revalidate')
        ..headers.set('Pragma', 'no-cache')
        ..headers.set('Expires', '0')
        ..headers.set('Access-Control-Allow-Origin', '*');

      await request.response.addStream(file.openRead());
      await request.response.close();
    } else {
      request.response.statusCode = HttpStatus.notFound;
      await request.response.close();
    }
  } catch (e) {
    try {
      request.response
        ..statusCode = HttpStatus.internalServerError
        ..write('Server error');
      await request.response.close();
    } catch (_) {}
  }
}
