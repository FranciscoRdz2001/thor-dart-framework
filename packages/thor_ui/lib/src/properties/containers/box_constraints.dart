import 'package:thor/thor.dart';
part 'box_constraints.g.dart';

@StyleAnnotation()
class BoxConstraints {
  @PropertyAnnotation('min-width')
  final Unit? minWidth;

  @PropertyAnnotation('min-height')
  final Unit? minHeight;

  @PropertyAnnotation('max-width')
  final Unit? maxWidth;

  @PropertyAnnotation('max-height')
  final Unit? maxHeight;

  const BoxConstraints({
    this.minWidth,
    this.minHeight,
    this.maxWidth,
    this.maxHeight,
  });
}
