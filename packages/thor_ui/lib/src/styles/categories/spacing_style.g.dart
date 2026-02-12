// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spacing_style.dart';

// **************************************************************************
// ThorComponentGenerator
// **************************************************************************

extension SpacingStyleCss on SpacingStyle {
  String toCss() => [
    if (paddingTop != null) 'padding-top: ${paddingTop!.toStyle()}',
    if (paddingRight != null) 'padding-right: ${paddingRight!.toStyle()}',
    if (paddingBottom != null) 'padding-bottom: ${paddingBottom!.toStyle()}',
    if (paddingLeft != null) 'padding-left: ${paddingLeft!.toStyle()}',
    if (marginTop != null) 'margin-top: ${marginTop!.toStyle()}',
    if (marginRight != null) 'margin-right: ${marginRight!.toStyle()}',
    if (marginBottom != null) 'margin-bottom: ${marginBottom!.toStyle()}',
    if (marginLeft != null) 'margin-left: ${marginLeft!.toStyle()}',
    if (gap != null) 'gap: ${gap!.toStyle()}',
  ].where((s) => s.isNotEmpty).join('; ');
}
