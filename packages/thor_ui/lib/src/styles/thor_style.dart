/// Abstract base class for all composite Thor style objects.
///
/// Every style category extends [ThorStyle].
///
/// Style hierarchy:
/// - [ThorStyle]
///   - DecorationStyle  (background, border, shadow, outline)
///   - TypographyStyle  (font, text, color)
///   - SpacingStyle     (padding, margin, gap)
///   - SizeStyle        (width, height, min/max)
///   - InteractionStyle (cursor, pointer-events, user-select)
abstract class ThorStyle {
  const ThorStyle();
}
