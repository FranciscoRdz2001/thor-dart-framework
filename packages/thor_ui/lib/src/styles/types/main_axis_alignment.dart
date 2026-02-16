import 'package:thor/thor.dart';

enum MainAxisAlignment with ToStyleMixin {
  start('flex-start'),
  end('flex-end'),
  center('center'),
  spaceBetween('space-between'),
  spaceAround('space-around'),
  spaceEvenly('space-evenly');

  const MainAxisAlignment(this.value);
  final String value;

  @override
  String toStyle() => value;
}
