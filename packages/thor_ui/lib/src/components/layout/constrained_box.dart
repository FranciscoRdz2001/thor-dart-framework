import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';
part 'constrained_box.g.dart';

@ComponentAnnotation('div', className: '.constrained-box')
class ConstrainedBox extends SingleChildElementComponent {
  @StyleAnnotation()
  final BoxConstraints constraints;

  const ConstrainedBox({super.key, required this.constraints, super.child});

  @override
  Component build(BuildContext context) {
    return ElementNode(
      tag: _$tag,
      children: children,
      attributes: {..._$attributes, 'style': ?_$styles},
    );
  }
}
