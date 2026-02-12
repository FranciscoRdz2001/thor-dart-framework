import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';
part 'decoration_style.g.dart';

@StyleAnnotation()
class DecorationStyle extends ThorStyle {
  const DecorationStyle({
    this.backgroundColor,
    this.backgroundImage,
    this.backgroundSize,
    this.backgroundPosition,
    this.backgroundRepeat,
    this.border,
    this.borderRadius,
    this.boxShadow,
    this.outline,
  });

  // ───────────── Background ─────────────

  @StylePropertyAnnotation('background-color')
  final Color? backgroundColor;

  @StylePropertyAnnotation('background-image')
  final String? backgroundImage;

  @StylePropertyAnnotation('background-size')
  final String? backgroundSize;

  @StylePropertyAnnotation('background-position')
  final String? backgroundPosition;

  @StylePropertyAnnotation('background-repeat')
  final String? backgroundRepeat;

  // ───────────── Border ─────────────

  @StylePropertyAnnotation('border')
  final String? border;

  @StylePropertyAnnotation('border-radius')
  final Unit? borderRadius;

  // ───────────── Shadow ─────────────

  @StylePropertyAnnotation('box-shadow')
  final BoxShadow? boxShadow;

  // ───────────── Outline (focus ring visual) ─────────────

  @StylePropertyAnnotation('outline')
  final String? outline;
}
