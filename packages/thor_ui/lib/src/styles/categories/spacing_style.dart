import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';
part 'spacing_style.g.dart';

@StyleAnnotation()
class SpacingStyle extends ThorStyle {
  const SpacingStyle({
    this.paddingTop,
    this.paddingRight,
    this.paddingBottom,
    this.paddingLeft,
    this.marginTop,
    this.marginRight,
    this.marginBottom,
    this.marginLeft,
    this.gap,
  });

  // ───────────── Padding ─────────────

  @StylePropertyAnnotation('padding-top')
  final Unit? paddingTop;

  @StylePropertyAnnotation('padding-right')
  final Unit? paddingRight;

  @StylePropertyAnnotation('padding-bottom')
  final Unit? paddingBottom;

  @StylePropertyAnnotation('padding-left')
  final Unit? paddingLeft;

  // ───────────── Margin ─────────────

  @StylePropertyAnnotation('margin-top')
  final Unit? marginTop;

  @StylePropertyAnnotation('margin-right')
  final Unit? marginRight;

  @StylePropertyAnnotation('margin-bottom')
  final Unit? marginBottom;

  @StylePropertyAnnotation('margin-left')
  final Unit? marginLeft;

  // ───────────── Gap ─────────────

  @StylePropertyAnnotation('gap')
  final Unit? gap;
}
