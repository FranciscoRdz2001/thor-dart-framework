import 'package:thor/thor.dart';

enum TextDecoration implements ToStyleMixin {
  none('none'),
  underline('underline'),
  overline('overline'),
  lineThrough('line-through');

  const TextDecoration(this.value);
  final String value;

  @override
  String toStyle() => value;
}
