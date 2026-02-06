// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'box.dart';

// **************************************************************************
// ThorComponentGenerator
// **************************************************************************

extension _$BoxGenerated on Box {
  String get _$tag => 'div';
  String get _$className => runtimeType.toString();
  Map<String, String> get _$attributes => {'class': _$className};
  String? get _$styles {
    final parts = <String>[
      if (height != null) 'height: ${height!.toStyle()}',
      if (width != null) 'width: ${width!.toStyle()}',
      if (alignment != null) alignment!.toCss(),
      if (padding != null) padding!.toCss(),
      if (constraints != null) constraints!.toCss(),
      if (decoration != null) decoration!.toCss(),
    ].where((s) => s.isNotEmpty);
    return parts.isEmpty ? null : parts.join('; ');
  }
}
