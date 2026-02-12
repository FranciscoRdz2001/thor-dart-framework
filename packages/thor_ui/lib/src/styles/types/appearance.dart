import 'package:thor/thor.dart';

enum Appearance with ToStyleMixin {
  none('none'),
  auto('auto'),
  textfield('textfield'),
  menulistButton('menulist-button');

  const Appearance(this.value);
  final String value;

  @override
  String toStyle() => value;
}
