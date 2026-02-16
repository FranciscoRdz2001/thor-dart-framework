import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';
part 'column.g.dart';

@ComponentAnnotation('div', className: '.column')
class Column extends Flex {
  Column({
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
      attributes: applyMainAxisSize(_$attributes, 'height'),
    );
  }
}
