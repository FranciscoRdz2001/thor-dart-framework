import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';
part 'size_style.g.dart';

@StyleAnnotation()
class SizeStyle extends ThorStyle {
  const SizeStyle({
    this.width,
    this.height,
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
  });

  @StylePropertyAnnotation('width')
  final Unit? width;

  @StylePropertyAnnotation('height')
  final Unit? height;

  @StylePropertyAnnotation('min-width')
  final Unit? minWidth;

  @StylePropertyAnnotation('max-width')
  final Unit? maxWidth;

  @StylePropertyAnnotation('min-height')
  final Unit? minHeight;

  @StylePropertyAnnotation('max-height')
  final Unit? maxHeight;
}
