import 'package:thor/thor.dart';
import 'package:thor_ui/src/styles/color.dart';

/// Represents a CSS `box-shadow` value.
///
/// This is a value type (like [Color]) that produces the value portion
/// of the `box-shadow` CSS property. Use with `@StylePropertyAnnotation('box-shadow')`.
///
/// ```dart
/// BoxShadow(
///   offsetX: 2.px,
///   offsetY: 4.px,
///   blurRadius: 8.px,
///   color: Color.rgba(0, 0, 0, 0.2),
/// )
/// ```
class BoxShadow with ToStyleMixin {
  final Unit offsetX;
  final Unit offsetY;
  final Unit? blurRadius;
  final Unit? spreadRadius;
  final Color? color;
  final bool inset;

  const BoxShadow({
    required this.offsetX,
    required this.offsetY,
    this.blurRadius,
    this.spreadRadius,
    this.color,
    this.inset = false,
  });

  @override
  String toStyle() {
    final parts = <String>[
      if (inset) 'inset',
      offsetX.toStyle(),
      offsetY.toStyle(),
      if (blurRadius != null) blurRadius!.toStyle(),
      if (spreadRadius != null) spreadRadius!.toStyle(),
      if (color != null) color!.toStyle(),
    ];
    return parts.join(' ');
  }
}
