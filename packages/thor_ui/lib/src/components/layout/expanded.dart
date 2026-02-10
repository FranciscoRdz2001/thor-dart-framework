import 'package:thor/thor.dart';
part 'expanded.g.dart';

@ComponentAnnotation('div', className: '.expanded')
class Expanded extends SingleChildElementComponent {
  @PropertyAnnotation('flex', isStyle: true)
  final int flex;

  const Expanded({super.key, this.flex = 1, super.child});

  @override
  Component build(BuildContext context) {
    final styles = [_$styles].whereType<String>().join('; ');
    return ElementNode(
      tag: _$tag,
      children: children,
      attributes: {'style': styles},
    );
  }
}
