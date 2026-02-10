import 'package:thor/thor.dart';

enum MainAxisAlignment with ToStyleMixin {
  start('main-axis-start'),
  end('main-axis-end'),
  center('main-axis-center'),
  spaceBetween('main-axis-space-between'),
  spaceAround('main-axis-space-around'),
  spaceEvenly('main-axis-space-evenly');

  const MainAxisAlignment(this.value);
  final String value;

  @override
  String toStyle() => value;
}
