import 'package:thor/thor.dart';

enum FontStyle implements ToStyleMixin {
  normal('normal'),
  italic('italic');

  const FontStyle(this.value);
  final String value;

  @override
  String toStyle() => value;
}
