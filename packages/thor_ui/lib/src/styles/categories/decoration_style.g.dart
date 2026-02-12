// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decoration_style.dart';

// **************************************************************************
// ThorComponentGenerator
// **************************************************************************

extension DecorationStyleCss on DecorationStyle {
  String toCss() => [
    if (backgroundColor != null)
      'background-color: ${backgroundColor!.toStyle()}',
    if (backgroundImage != null) 'background-image: ${backgroundImage!}',
    if (backgroundSize != null) 'background-size: ${backgroundSize!}',
    if (backgroundPosition != null)
      'background-position: ${backgroundPosition!}',
    if (backgroundRepeat != null) 'background-repeat: ${backgroundRepeat!}',
    if (border != null) 'border: ${border!}',
    if (borderRadius != null) 'border-radius: ${borderRadius!.toStyle()}',
    if (boxShadow != null) 'box-shadow: ${boxShadow!.toStyle()}',
    if (outline != null) 'outline: ${outline!}',
  ].where((s) => s.isNotEmpty).join('; ');
}
