import 'package:thor/thor.dart';
import 'package:thor_ui/src/properties/containers/box_constraints.dart';
import 'package:thor_ui/thor_ui.dart';
part 'box.g.dart';

@ComponentAnnotation('div')
class Box extends DecoratedBox {
  @PropertyAnnotation('height')
  final Unit? height;

  @PropertyAnnotation('width')
  final Unit? width;

  @StyleAnnotation()
  final Alignment? alignment;

  @StyleAnnotation()
  final EdgeInsets? padding;

  @StyleAnnotation()
  final BoxConstraints? constraints;

  const Box({
    super.key,
    this.height,
    this.width,
    this.padding,
    super.child,
    super.decoration,
    this.constraints,
    this.alignment,
  });

  @override
  Component build(BuildContext context) {
    return ElementNode(
      tag: _$tag,
      children: children,
      attributes: {..._$attributes, 'style': ?_$styles},
    );
  }
}
