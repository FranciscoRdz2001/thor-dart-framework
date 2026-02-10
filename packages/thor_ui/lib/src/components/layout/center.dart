import 'package:thor/thor.dart';
part 'center.g.dart';

@ComponentAnnotation('div', className: '.center')
class Center extends SingleChildElementComponent {
  const Center({super.key, required super.child});
  @override
  Component build(BuildContext context) {
    return ElementNode(
      tag: _$tag,
      children: children,
      attributes: _$attributes,
    );
  }
}
