// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'align.dart';

// **************************************************************************
// ThorComponentGenerator
// **************************************************************************

extension _$AlignGenerated on Align {
  String get _$tag => 'div';
  String get _$className => 'align';
  String get _$classNames => [
    _$className,
    ...styleClasses.map((s) => s.className),
  ].map((c) => c.startsWith('.') ? c.substring(1) : c).join(' ');
  Map<String, String> get _$attributes => {
    'class': _$classNames,
    'style': ?_$styles,
  };
  String? get _$styles {
    final parts = <String>[
      if (alignment != null) alignment!.toStyle(),
    ].where((s) => s.isNotEmpty);
    return parts.isEmpty ? null : parts.join('; ');
  }
}
