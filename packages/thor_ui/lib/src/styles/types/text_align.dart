import 'package:thor/thor.dart';

enum TextAlign implements ToStyleMixin {
  left('left'),
  right('right'),
  center('center'),
  justify('justify');

  const TextAlign(this.value);
  final String value;

  @override
  String toStyle() => value;
}
