import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';
part 'flex.g.dart';

@ComponentAnnotation('div')
class Flex extends MultiChildElementComponent {
  Flex({
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.gap,
    this.spacing,
    this.size,
    super.key,
    super.styleClasses,
    List<Component>? children,
  }) : _children = children ?? [];

  @StylePropertyAnnotation('justify-content')
  final MainAxisAlignment mainAxisAlignment;

  final MainAxisSize mainAxisSize;

  @StylePropertyAnnotation('align-items')
  final CrossAxisAlignment crossAxisAlignment;

  /// Shorthand for SpacingStyle(gap: ...). If both [gap] and
  /// [spacing] with gap are provided, [gap] takes precedence.
  @StylePropertyAnnotation('gap')
  final Unit? gap;

  @StyleAnnotation()
  final SpacingStyle? spacing;

  @StyleAnnotation()
  final SizeStyle? size;

  final List<Component> _children;

  @override
  String get tag => _$tag;

  @override
  List<Component> get children => _children;

  /// Applies [mainAxisSize] to the style string.
  /// [mainAxisProperty] is 'width' for Row, 'height' for Column.
  Map<String, String> applyMainAxisSize(
    Map<String, String> attrs,
    String mainAxisProperty,
  ) {
    if (mainAxisSize == MainAxisSize.max) return attrs;
    final style = attrs['style'] ?? '';
    final sep = style.isNotEmpty ? '; ' : '';
    return {...attrs, 'style': '$style$sep$mainAxisProperty: fit-content'};
  }
}
