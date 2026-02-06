import 'dart:html' as html;

import 'package:thor/src/components/web_component.dart';
import 'package:thor/src/core/build_context.dart';
import 'package:thor/src/renderers/dom_renderer.dart';
import 'package:thor/src/renderers/nodes/node.dart';
import 'package:thor/src/renderers/thor_renderer.dart';

class DomTarget {
  DomTarget({
    required this.root,
    required this.container,
    required this.context,
  });

  final WebComponent root;
  final html.Element container;
  final BuildContext context;

  final ThorRenderer _renderer = const ThorRenderer();
  final DomRenderer _domRenderer = const DomRenderer();

  Node? _prevNode;
  html.Node? _domRoot;

  /// First render + mount
  void start() {
    final node = _renderer.render(root, context);
    _domRoot = _domRenderer.mount(node, container);
    _prevNode = node;
  }

  /// Rebuild + patch
  void rebuild() {
    final newNode = _renderer.render(root, context);

    _domRoot = _domRenderer.patch(_prevNode!, newNode, _domRoot!);

    _prevNode = newNode;
  }
}
