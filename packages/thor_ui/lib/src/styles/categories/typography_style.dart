import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';
part 'typography_style.g.dart';

/// Category for typography styles: fonts, text alignment, and text decoration.
///
/// Subclasses: [TextStyle]
@StyleAnnotation()
class TypographyStyle extends ThorStyle {
  const TypographyStyle({
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.color,
    this.textAlign,
    this.decoration,
    this.decorationColor,
    this.letterSpacing,
    this.lineHeight,
    this.fontFamily,
    this.overflow,
    this.maxLines,
    this.wordSpacing,
    this.direction,
  });

  @StylePropertyAnnotation('font-size')
  final Unit? fontSize;
  @StylePropertyAnnotation('font-weight')
  final FontWeight? fontWeight;
  @StylePropertyAnnotation('font-style')
  final FontStyle? fontStyle;
  @StylePropertyAnnotation('color')
  final Color? color;
  @StylePropertyAnnotation('text-align')
  final TextAlign? textAlign;
  @StylePropertyAnnotation('text-decoration')
  final TextDecoration? decoration;
  @StylePropertyAnnotation('text-decoration-color')
  final Color? decorationColor;
  @StylePropertyAnnotation('letter-spacing')
  final String? letterSpacing;
  @StylePropertyAnnotation('line-height')
  final String? lineHeight;
  @StylePropertyAnnotation('font-family')
  final String? fontFamily;
  @StylePropertyAnnotation('text-overflow')
  final TextOverflow? overflow;
  @StylePropertyAnnotation('word-spacing')
  final Unit? wordSpacing;
  @StylePropertyAnnotation('direction')
  final TextDirection? direction;

  final int? maxLines;
}
