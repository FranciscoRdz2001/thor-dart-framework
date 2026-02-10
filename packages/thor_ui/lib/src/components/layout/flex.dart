import 'package:thor/thor.dart';
import 'package:thor_ui/src/styles/types/cross_axis_alignment.dart';
import 'package:thor_ui/src/styles/types/main_axis_alignment.dart';
import 'package:thor_ui/src/styles/types/main_axis_size.dart';
part 'flex.g.dart';

@ComponentAnnotation('div')
class Flex extends MultiChildElementComponent {
  Flex({
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.gap,
    super.key,
    List<Component>? children,
  }) : _children = children ?? [];

  @ClassNameAnnotation()
  final MainAxisAlignment mainAxisAlignment;
  @ClassNameAnnotation()
  final MainAxisSize mainAxisSize;
  @ClassNameAnnotation()
  final CrossAxisAlignment crossAxisAlignment;
  @PropertyAnnotation('gap')
  final Unit? gap;

  final List<Component> _children;

  @override
  String get tag => _$tag;

  @override
  List<Component> get children => _children;
}
