import 'package:thor/thor.dart';
part 'expanded.g.dart';

@ComponentAnnotation('div', className: '.expanded')
class Expanded extends SingleChildElementComponent {
  @StylePropertyAnnotation('flex', isStyle: true)
  final int flex;

  const Expanded({super.key, super.styleClasses, this.flex = 1, super.child});

  @override
  Component build(BuildContext context) {
    return ElementNode(
      tag: _$tag,
      children: children,
      attributes: _$attributes,
    );
  }
}
