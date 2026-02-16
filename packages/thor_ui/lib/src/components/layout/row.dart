import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';
part 'row.g.dart';

@ComponentAnnotation('div', className: '.row')
class Row extends Flex {
  Row({
    super.children,
    super.mainAxisAlignment,
    super.crossAxisAlignment,
    super.mainAxisSize,
    super.gap,
    super.spacing,
    super.size,
  });

  @override
  Component build(BuildContext context) {
    return ElementNode(
      tag: _$tag,
      key: key,
      children: children,
      attributes: applyMainAxisSize(_$attributes, 'width'),
    );
  }
}
