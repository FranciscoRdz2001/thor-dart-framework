import 'package:thor/thor.dart';
import 'package:thor_ui/src/properties/text/text_style.dart';

part 'text.g.dart';

@ComponentAnnotation('span')
class Text extends LeafElementComponent {
  final String data;
  const Text(this.data, {super.key, this.style});

  @StyleAnnotation()
  final TextStyle? style;

  @override
  Component build(BuildContext context) {
    return ElementNode(
      tag: _$tag,
      children: [TextNode(data)],
      attributes: {..._$attributes, 'style': ?_$styles},
    );
  }

  @override
  String get tag => _$tag;
}
