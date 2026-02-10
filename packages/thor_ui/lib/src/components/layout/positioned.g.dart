// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'positioned.dart';

// **************************************************************************
// ThorComponentGenerator
// **************************************************************************

extension _$PositionedGenerated on Positioned {
  String get _$tag => 'div';
  String get _$className => 'positioned';
  Map<String, String> get _$attributes => {
    'class': _$className,
    'style': ?_$styles,
  };
  String? get _$styles {
    final parts = <String>[
      if (position != null) 'position: ${position!.toStyle()}',
      if (top != null) 'top: ${top!.toStyle()}',
      if (right != null) 'right: ${right!.toStyle()}',
      if (bottom != null) 'bottom: ${bottom!.toStyle()}',
      if (left != null) 'left: ${left!.toStyle()}',
    ].where((s) => s.isNotEmpty);
    return parts.isEmpty ? null : parts.join('; ');
  }
}
