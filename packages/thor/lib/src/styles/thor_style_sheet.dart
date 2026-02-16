import 'package:thor/src/styles/style_class.dart';

/// Base class for declaring a collection of reusable [StyleClass] definitions.
///
/// Extend this class to define a stylesheet that groups related styles.
/// Register it via [DomTarget.styleSheets] so the CSS is injected before
/// the first render.
///
/// ```dart
/// class AppStyles extends ThorStyleSheet {
///   static final heading = StyleClass('heading', css([
///     TypographyStyle(fontSize: 32.px, fontWeight: FontWeight.bold),
///   ]));
///
///   static final cardBox = StyleClass('card-box', css([
///     SpacingStyle(paddingTop: 20.px, paddingBottom: 20.px),
///     DecorationStyle(backgroundColor: Color.white, borderRadius: 8.px),
///   ]));
///
///   @override
///   List<StyleClass> get styles => [heading, cardBox];
/// }
/// ```
abstract class ThorStyleSheet {
  const ThorStyleSheet();

  /// All [StyleClass] definitions provided by this stylesheet.
  List<StyleClass> get styles;
}
