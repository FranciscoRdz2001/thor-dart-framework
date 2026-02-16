import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';
part 'positioned.g.dart';

@ComponentAnnotation('div', className: '.positioned')
class Positioned extends SingleChildElementComponent {
  Positioned({
    super.key,
    super.styleClasses,
    this.position,
    super.child,
    this.top,
    this.right,
    this.bottom,
    this.left,
  });

  @StylePropertyAnnotation('position')
  final Position? position;

  @StylePropertyAnnotation('top')
  final Unit? top;

  @StylePropertyAnnotation('right')
  final Unit? right;

  @StylePropertyAnnotation('bottom')
  final Unit? bottom;

  @StylePropertyAnnotation('left')
  final Unit? left;

  @override
  Component build(BuildContext context) {
    return ElementNode(
      tag: _$tag,
      key: key,
      attributes: _$attributes,
      children: children,
    );
  }
}
