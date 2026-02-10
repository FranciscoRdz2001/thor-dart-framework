import 'package:thor/thor.dart';

enum Position with ToStyleMixin {
  absolute('absolute'),
  relative('relative'),
  fixed('fixed'),
  sticky('sticky'),
  static('static'),
  inherit('inherit'),
  initial('initial'),
  unset('unset');

  const Position(this.value);
  final String value;
  @override
  String toStyle() => value;
}
