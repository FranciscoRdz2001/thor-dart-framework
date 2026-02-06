import 'package:thor/src/core/key.dart';
import 'package:thor/src/elements/text_element.dart';
import 'package:thor/src/elements/thor_element.dart';
import 'package:thor/src/renderers/nodes/node.dart';

class TextNode extends Node {
  final String text;

  const TextNode(this.text, {Key? key}) : super(key: key);

  @override
  ThorElement createElement() => TextElement(this);
}
