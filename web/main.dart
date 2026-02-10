import 'dart:html' as html;

import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';
import 'pages/store_page.dart';

/// A stateful counter component.
class Counter extends StatefulComponent {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  final int _count = 0;

  @override
  void initState() {
    super.initState();
    print('Counter: initState');
  }

  @override
  void didMount() {
    print('Counter: didMount');
  }

  @override
  void dispose() {
    print('Counter: dispose');
    super.dispose();
  }

  @override
  Component build(BuildContext context) {
    return Row(
      children: [
        Text('Counter: $_count'),
        Expanded(
          child: Row(
            gap: 20.px,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Welcome to Thor'),
              Box(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 50.px),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(12.px),
                  color: Color.red,
                ),
                child: Text(
                  'This is a box',
                  style: TextStyle(
                    fontSize: 24.px,
                    color: Color.white,
                    fontWeight: FontWeight.extraBold,
                  ),
                ),
              ),

              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(8.px),
                  color: Color.blue,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Counter: $_count'),
                    Text('--------Counter: $_count --------'),
                    Text('---------------- Counter: $_count ----------------'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Root app component using composition via ComponentNode.
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return ElementNode(
      tag: 'div',
      attributes: {'id': 'root'},
      children: [StorePage()],
    );
  }
}

void main() {
  final container = html.document.querySelector('#output');

  if (container == null) {
    print('Error: #app container not found');
    return;
  }

  final target = DomTarget(
    root: const App(),
    container: container,
    breakpoint: Breakpoint.md,
    styles: [ThorStyleSheet()],
    size: Size(
      html.window.innerWidth!.toDouble(),
      html.window.innerHeight!.toDouble(),
    ),
  );

  target.start();
}
