import 'package:thor/thor.dart';

enum Alignment with ToStyleMixin {
  topLeft('flex-start', 'flex-start'),
  topCenter('flex-start', 'center'),
  topRight('flex-start', 'flex-end'),
  centerLeft('center', 'flex-start'),
  center('center', 'center'),
  centerRight('center', 'flex-end'),
  bottomLeft('flex-end', 'flex-start'),
  bottomCenter('flex-end', 'center'),
  bottomRight('flex-end', 'flex-end');

  const Alignment(this.alignItems, this.justifyContent);
  final String alignItems;
  final String justifyContent;

  @override
  String toStyle() =>
      'flex; flex: 1; align-items: $alignItems; justify-content: $justifyContent';
}
