// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size_style.dart';

// **************************************************************************
// ThorComponentGenerator
// **************************************************************************

extension SizeStyleCss on SizeStyle {
  String toCss() => [
    if (width != null) 'width: ${width!.toStyle()}',
    if (height != null) 'height: ${height!.toStyle()}',
    if (minWidth != null) 'min-width: ${minWidth!.toStyle()}',
    if (maxWidth != null) 'max-width: ${maxWidth!.toStyle()}',
    if (minHeight != null) 'min-height: ${minHeight!.toStyle()}',
    if (maxHeight != null) 'max-height: ${maxHeight!.toStyle()}',
  ].where((s) => s.isNotEmpty).join('; ');
}
