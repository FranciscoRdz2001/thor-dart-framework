import 'package:thor/thor.dart';

enum MainAxisSize with ToStyleMixin {
  min('.main-axis-size-min'),
  max('.main-axis-size-max');

  const MainAxisSize(this.value);
  final String value;
  @override
  String toStyle() => value;
}
