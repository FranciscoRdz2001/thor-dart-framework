import 'package:thor/thor.dart';

enum Display with ToStyleMixin {
  block('block'),
  inline('inline'),
  inlineBlock('inline-block'),
  flex('flex'),
  inlineFlex('inline-flex'),
  grid('grid'),
  inlineGrid('inline-grid'),
  none('none'),
  contents('contents');

  const Display(this.value);
  final String value;

  @override
  String toStyle() => value;
}
