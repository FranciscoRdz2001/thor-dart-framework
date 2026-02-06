import 'package:thor/thor.dart';

part 'text.g.dart';

@ComponentAnnotation('span')
class Text extends LeafElementComponent {
  final String data;
  const Text(this.data, {super.key});

  @override
  Component build(BuildContext context) {
    return ElementNode(tag: _$tag, children: [TextNode(data)]);
  }

  @override
  String get tag => _$tag;
}
