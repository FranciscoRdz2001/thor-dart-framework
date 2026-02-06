import 'dart:html' as html;

import 'package:thor/thor.dart';

/// A stateful counter component.
class Counter extends StatefulComponent {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;

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
  Node build(BuildContext context) {
    return ElementNode(
      tag: 'div',
      attributes: {'class': 'counter'},
      children: [
        ElementNode(tag: 'h1', children: [TextNode('Hello, Thor!')]),
        ElementNode(tag: 'p', children: [TextNode('Count: $_count')]),
        ElementNode(
          tag: 'button',
          events: {'click': (_) => setState(() => _count++)},
          children: [TextNode('Increment')],
        ),
        ElementNode(
          tag: 'button',
          events: {'click': (_) => setState(() => _count--)},
          children: [TextNode('Decrement')],
        ),
      ],
    );
  }
}

/// Root app component using composition via ComponentNode.
class App extends StatelessComponent {
  const App({super.key});

  @override
  Node build(BuildContext context) {
    return ElementNode(
      tag: 'div',
      attributes: {'id': 'root'},
      children: [ComponentNode(const Counter())],
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
    size: Size(
      html.window.innerWidth!.toDouble(),
      html.window.innerHeight!.toDouble(),
    ),
  );

  target.start();
}
