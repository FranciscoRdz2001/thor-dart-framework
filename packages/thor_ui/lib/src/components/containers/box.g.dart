// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'box.dart';

// **************************************************************************
// ThorComponentGenerator
// **************************************************************************

extension _$BoxGenerated on Box {
  String get _$tag => 'div';
  String get _$className => 'box';
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
      if (spacing != null) spacing!.toCss(),
      if (size != null) size!.toCss(),
      if (decoration != null) decoration!.toCss(),
    ].where((s) => s.isNotEmpty);
    return parts.isEmpty ? null : parts.join('; ');
  }
}
