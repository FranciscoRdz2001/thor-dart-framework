import 'package:thor/thor.dart';
import 'dart:html' as html;

import 'package:web/web.dart' as web show window;

// Componente de ejemplo
class App extends WebComponent {
  const App();

  @override
  String get tag => 'div';

  @override
  Node build(BuildContext context) {
    return ElementNode(tag: 'h1', children: [TextNode('Hello, Thorrr!')]);
  }
}

void main() {
  final html.Element? container = html.document.querySelector('#output');

  if (container == null) {
    return;
  }

  final target = DomTarget(
    root: const App(),
    container: container,
    context: BuildContext(
      breakpoint: Breakpoint.md,
      size: Size(
        web.window.innerWidth.toDouble(),
        web.window.innerHeight.toDouble(),
      ),
    ),
  );

  target.start();

  // Ejemplo: rebuild en click
}
