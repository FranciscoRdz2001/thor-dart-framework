import 'package:thor/thor.dart';
import 'package:thor_ui/src/components/layout/flex.dart';
import 'package:thor_ui/src/styles/types/cross_axis_alignment.dart';
import 'package:thor_ui/src/styles/types/flex_direction.dart';
import 'package:thor_ui/src/styles/types/main_axis_alignment.dart';
import 'package:thor_ui/src/styles/types/main_axis_size.dart';
part 'row.g.dart';

@ComponentAnnotation('div')
class Row extends Flex {
  Row({
    List<Component>? children,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    Unit? gap,
  }) : super(
         FlexDirection.row,
         display: 'flex',
         children: children,
         mainAxisAlignment: mainAxisAlignment,
         crossAxisAlignment: crossAxisAlignment,
         mainAxisSize: mainAxisSize,
         gap: gap,
       );

  @override
  Component build(BuildContext context) {
    final styles = [
      _$styles,
      if (mainAxisSize == MainAxisSize.max) 'width: 100%',
    ].whereType<String>().join('; ');
    return ElementNode(
      tag: _$tag,
      key: key,
      children: children,
      attributes: {..._$attributes, 'style': styles},
    );
  }
}
