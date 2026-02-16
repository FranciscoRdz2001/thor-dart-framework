/// A named CSS class backed by pre-computed CSS properties.
///
/// [StyleClass] is the unit of reusable styling in Thor. Each instance
/// pairs a CSS class name with a CSS properties string.
///
/// ```dart
/// // Using the thor_ui css() helper:
/// final heading = StyleClass('heading', css([
///   TypographyStyle(fontSize: 32.px, fontWeight: FontWeight.bold),
/// ]));
///
/// // Or with raw CSS:
/// final heading = StyleClass('heading', 'font-size: 32px; font-weight: 700');
/// ```
class StyleClass {
  /// The CSS class name (without the leading dot).
  final String className;

  /// The CSS properties string (e.g. `'font-size: 32px; font-weight: 700'`).
  final String css;

  const StyleClass(this.className, this.css);

  /// The full CSS rule: `.className { css }`.
  String get cssRule => '.$className { $css }';
}
