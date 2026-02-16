import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';
part 'align.g.dart';

@ComponentAnnotation('div', className: '.align')
class Align extends SingleChildElementComponent {
  @StyleAnnotation()
  final Alignment? alignment;

  const Align({required this.alignment, super.child});

  @override
  Component build(BuildContext context) {
    return ElementNode(
      tag: 'div',
      key: key,
      children: children,
      attributes: _$attributes,
    );
  }
}
