import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';
part 'box.g.dart';

@ComponentAnnotation('div', className: '.box')
class Box extends SingleChildElementComponent {
  @StyleAnnotation()
  final Alignment? alignment;

  @StyleAnnotation()
  final SpacingStyle? spacing;

  @StyleAnnotation()
  final SizeStyle? size;

  @StyleAnnotation()
  final DecorationStyle? decoration;

  const Box({
    super.key,
    super.styleClasses,
    this.spacing,
    super.child,
    this.decoration,
    this.size,
    this.alignment,
  });

  @override
  Component build(BuildContext context) {
    return ElementNode(
      tag: _$tag,
      children: children,
      attributes: _$attributes,
    );
  }
}
