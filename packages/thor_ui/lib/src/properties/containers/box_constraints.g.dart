// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'box_constraints.dart';

// **************************************************************************
// ThorComponentGenerator
// **************************************************************************

extension BoxConstraintsCss on BoxConstraints {
  String toCss() => [
    if (minWidth != null) 'min-width: ${minWidth!.toStyle()}',
    if (minHeight != null) 'min-height: ${minHeight!.toStyle()}',
    if (maxWidth != null) 'max-width: ${maxWidth!.toStyle()}',
    if (maxHeight != null) 'max-height: ${maxHeight!.toStyle()}',
  ].where((s) => s.isNotEmpty).join('; ');
}
