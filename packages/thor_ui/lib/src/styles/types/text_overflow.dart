import 'package:thor/thor.dart';

enum TextOverflow with ToStyleMixin {
  clip('clip'),
  ellipsis('ellipsis'),
  visible('visible');

  const TextOverflow(this.value);
  final String value;

  @override
  String toStyle() => value;
}
