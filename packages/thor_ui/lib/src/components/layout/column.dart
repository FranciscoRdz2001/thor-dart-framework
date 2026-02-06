import 'package:thor/thor.dart';
import 'package:thor_ui/src/components/layout/flex.dart';
import 'package:thor_ui/src/styles/types/cross_axis_alignment.dart';
import 'package:thor_ui/src/styles/types/flex_direction.dart';
import 'package:thor_ui/src/styles/types/main_axis_alignment.dart';
import 'package:thor_ui/src/styles/types/main_axis_size.dart';
part 'column.g.dart';

@ComponentAnnotation('div')
class Column extends Flex {
  Column({
    List<Component>? children,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    Unit? gap,
  }) : super(
         FlexDirection.column,
         display: 'flex',
         children: children,
         mainAxisAlignment: mainAxisAlignment,
         crossAxisAlignment: crossAxisAlignment,
         mainAxisSize: mainAxisSize,
         gap: gap,
       );

  @override
  Component build(BuildContext context) {
    return ElementNode(
      tag: _$tag,
      key: key,
      children: children,
      attributes: {..._$attributes, 'style': ?_$styles},
    );
  }
}
