import 'package:thor/thor.dart';

enum TextDirection with ToStyleMixin {
  ltr('ltr'),
  rtl('rtl');

  const TextDirection(this.value);
  final String value;

  @override
  String toStyle() => value;
}
