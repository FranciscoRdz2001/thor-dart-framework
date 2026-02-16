// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'column.dart';

// **************************************************************************
// ThorComponentGenerator
// **************************************************************************

extension _$ColumnGenerated on Column {
  String get _$tag => 'div';
  String get _$className => 'column';
  Map<String, String> get _$attributes => {
    'class': _$className,
    'style': ?_$styles,
  };
  String? get _$styles {
    final parts = <String>[
      'justify-content: ${mainAxisAlignment.toStyle()}',
      'align-items: ${crossAxisAlignment.toStyle()}',
      if (gap != null) 'gap: ${gap!.toStyle()}',
      if (spacing != null) spacing!.toCss(),
      if (size != null) size!.toCss(),
    ].where((s) => s.isNotEmpty);
    return parts.isEmpty ? null : parts.join('; ');
  }
}
