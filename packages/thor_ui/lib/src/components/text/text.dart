import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';

part 'text.g.dart';

@ComponentAnnotation('span', className: 'text')
class Text extends LeafElementComponent {
  final String data;
  const Text(
    this.data, {
    super.key,
    super.styleClasses,
    this.typoGraphyStyle,
    this.interactionStyle,
  });

  @StyleAnnotation()
  final TypographyStyle? typoGraphyStyle;
  @StyleAnnotation()
  final InteractionStyle? interactionStyle;

  @override
  Component build(BuildContext context) {
    return ElementNode(
      tag: _$tag,
      children: [TextNode(data)],
      attributes: _$attributes,
    );
  }

  @override
  String get tag => _$tag;
}
