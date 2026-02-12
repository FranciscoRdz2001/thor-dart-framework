import 'package:thor/thor.dart';

enum Alignment with ToStyleMixin {
  topLeft('align-top-left', 'flex-start', 'flex-start'),
  topCenter('align-top-center', 'flex-start', 'center'),
  topRight('align-top-right', 'flex-start', 'flex-end'),
  centerLeft('align-center-left', 'center', 'flex-start'),
  center('align-center', 'center', 'center'),
  centerRight('align-center-right', 'center', 'flex-end'),
  bottomLeft('align-bottom-left', 'flex-end', 'flex-start'),
  bottomCenter('align-bottom-center', 'flex-end', 'center'),
  bottomRight('align-bottom-right', 'flex-end', 'flex-end');

  const Alignment(this.value, this.alignItems, this.justifyContent);
  final String value;
  final String alignItems;
  final String justifyContent;

  @override
  String toStyle() => value;

  String toCss() =>
      'display: flex; align-items: $alignItems; justify-content: $justifyContent';
}
