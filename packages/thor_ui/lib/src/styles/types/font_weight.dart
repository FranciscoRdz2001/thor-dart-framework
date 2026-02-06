import 'package:thor/thor.dart';

enum FontWeight implements ToStyleMixin {
  thin(100),
  extraLight(200),
  light(300),
  normal(400),
  medium(500),
  semiBold(600),
  bold(700),
  extraBold(800),
  black(900);

  const FontWeight(this.value);
  final int value;

  @override
  String toStyle() => value.toString();
}
