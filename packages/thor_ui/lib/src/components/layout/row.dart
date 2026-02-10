import 'package:thor/thor.dart';
import 'package:thor_ui/src/components/layout/flex.dart';
import 'package:thor_ui/src/styles/types/main_axis_size.dart';
part 'row.g.dart';

@ComponentAnnotation('div', className: '.row')
class Row extends Flex {
  Row({
    super.children,
    super.mainAxisAlignment,
    super.crossAxisAlignment,
    super.mainAxisSize,
    super.gap,
  });

  @override
  Component build(BuildContext context) {
    final styles = [
      _$styles,
      if (mainAxisSize == MainAxisSize.max) 'align-self: stretch',
    ].whereType<String>().join('; ');
    return ElementNode(
      tag: _$tag,
      key: key,
      children: children,
      attributes: {..._$attributes, 'style': styles},
    );
  }
}
