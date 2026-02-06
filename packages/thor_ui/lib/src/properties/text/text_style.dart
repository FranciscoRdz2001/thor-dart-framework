import 'package:thor/thor.dart';
import 'package:thor_ui/src/styles/styles.dart';

part 'text_style.g.dart';

@StyleAnnotation()
class TextStyle {
  @PropertyAnnotation('font-size')
  final Unit? fontSize;
  @PropertyAnnotation('font-weight')
  final FontWeight? fontWeight;
  @PropertyAnnotation('font-style')
  final FontStyle? fontStyle;
  @PropertyAnnotation('color')
  final Color? color;
  @PropertyAnnotation('text-align')
  final TextAlign? textAlign;
  @PropertyAnnotation('text-decoration')
  final TextDecoration? decoration;
  @PropertyAnnotation('text-decoration-color')
  final Color? decorationColor;
  @PropertyAnnotation('letter-spacing')
  final String? letterSpacing;
  @PropertyAnnotation('line-height')
  final String? lineHeight;
  @PropertyAnnotation('font-family')
  final String? fontFamily;
  @PropertyAnnotation('text-overflow')
  final TextOverflow? overflow;
  final int? maxLines;

  const TextStyle({
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
  });
}
