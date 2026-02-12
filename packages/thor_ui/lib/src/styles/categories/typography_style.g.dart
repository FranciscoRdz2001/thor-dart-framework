// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'typography_style.dart';

// **************************************************************************
// ThorComponentGenerator
// **************************************************************************

extension TypographyStyleCss on TypographyStyle {
  String toCss() => [
    if (fontSize != null) 'font-size: ${fontSize!.toStyle()}',
    if (fontWeight != null) 'font-weight: ${fontWeight!.toStyle()}',
    if (fontStyle != null) 'font-style: ${fontStyle!.toStyle()}',
    if (color != null) 'color: ${color!.toStyle()}',
    if (textAlign != null) 'text-align: ${textAlign!.toStyle()}',
    if (decoration != null) 'text-decoration: ${decoration!.toStyle()}',
    if (decorationColor != null)
      'text-decoration-color: ${decorationColor!.toStyle()}',
    if (letterSpacing != null) 'letter-spacing: ${letterSpacing!}',
    if (lineHeight != null) 'line-height: ${lineHeight!}',
    if (fontFamily != null) 'font-family: ${fontFamily!}',
    if (overflow != null) 'text-overflow: ${overflow!.toStyle()}',
    if (wordSpacing != null) 'word-spacing: ${wordSpacing!.toStyle()}',
    if (direction != null) 'direction: ${direction!.toStyle()}',
  ].where((s) => s.isNotEmpty).join('; ');
}
