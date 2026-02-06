import 'package:thor/thor.dart';
import 'package:thor_ui/src/styles/types/cross_axis_alignment.dart';
import 'package:thor_ui/src/styles/types/main_axis_alignment.dart';
import 'package:thor_ui/src/styles/types/main_axis_size.dart';
import 'package:thor_ui/src/styles/types/flex_direction.dart';
part 'flex.g.dart';

@ComponentAnnotation('div')
class Flex extends MultiChildElementComponent {
  Flex(
    this.direction, {
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.gap,
    this.display = 'flex',
    super.key,
    List<Component>? children,
  }) : _children = children ?? [];

  @PropertyAnnotation('display', isStyle: true)
  final String display;
  @PropertyAnnotation('flex-direction')
  final FlexDirection direction;
  @PropertyAnnotation('justify-content')
  final MainAxisAlignment mainAxisAlignment;
  @PropertyAnnotation('align-items')
  final CrossAxisAlignment crossAxisAlignment;
  @PropertyAnnotation('gap')
  final Unit? gap;

  final MainAxisSize mainAxisSize;

  final List<Component> _children;

  @override
  String get tag => _$tag;

  @override
  List<Component> get children => _children;
}
