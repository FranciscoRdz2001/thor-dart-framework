import 'package:thor_ui/src/styles/thor_style.dart';
import 'package:thor_ui/src/styles/categories/decoration_style.dart';
import 'package:thor_ui/src/styles/categories/interaction_style.dart';
import 'package:thor_ui/src/styles/categories/size_style.dart';
import 'package:thor_ui/src/styles/categories/spacing_style.dart';
import 'package:thor_ui/src/styles/categories/typography_style.dart';

/// Converts a list of [ThorStyle] objects into a CSS properties string.
///
/// Uses type dispatch on the known style categories to call each one's
/// generated `toCss()` extension method.
///
/// ```dart
/// final cssString = css([
///   TypographyStyle(fontSize: 32.px, fontWeight: FontWeight.bold),
///   SpacingStyle(paddingTop: 20.px),
/// ]);
/// // → 'font-size: 32px; font-weight: 700; padding-top: 20px'
/// ```
String css(List<ThorStyle> styles) {
  return styles
      .map(_styleToCss)
      .where((s) => s.isNotEmpty)
      .join('; ');
}

String _styleToCss(ThorStyle style) => switch (style) {
      SpacingStyle s => s.toCss(),
      SizeStyle s => s.toCss(),
      DecorationStyle s => s.toCss(),
      TypographyStyle s => s.toCss(),
      InteractionStyle s => s.toCss(),
      _ => '',
    };
