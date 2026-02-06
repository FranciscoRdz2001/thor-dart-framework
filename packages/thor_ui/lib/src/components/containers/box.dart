import 'package:thor/thor.dart';
part 'box.g.dart';

@ComponentAnnotation('div')
class Box extends SingleChildElementComponent {
  @PropertyAnnotation('height')
  final Unit? height;

  @PropertyAnnotation('width')
  final Unit? width;

  const Box({super.key, this.height, this.width, super.child});

  @override
  Component build(BuildContext context) {
    return ElementNode(
      tag: _$tag,
      children: children,
      attributes: {'style': ?_$styles},
    );
  }
}
