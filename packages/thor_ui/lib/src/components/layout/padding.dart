import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';
part 'padding.g.dart';

@ComponentAnnotation('div')
class Padding extends SingleChildElementComponent {
  @StyleAnnotation()
  final EdgeInsets padding;

  const Padding({super.key, required this.padding, super.child});
  @override
  Component build(BuildContext context) {
    return ElementNode(
      tag: _$tag,
      children: children,
      attributes: {..._$attributes, 'style': ?_$styles},
    );
  }
}
