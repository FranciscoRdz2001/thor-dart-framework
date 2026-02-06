import 'package:thor/src/renderers/nodes/node.dart';

class ElementNode extends Node {
  final String tag;
  final Map<String, String> attributes;
  final List<Node> children;

  const ElementNode({
    required this.tag,
    this.attributes = const {},
    this.children = const [],
  });
}
  