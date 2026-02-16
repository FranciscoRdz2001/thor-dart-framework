import 'package:thor/thor.dart';

enum Alignment with ToStyleMixin {
  topLeft('flex-start', 'flex-start', 'align-top-left'),
  topCenter('flex-start', 'center', 'align-top-center'),
  topRight('flex-start', 'flex-end', 'align-top-right'),
  centerLeft('center', 'flex-start', 'align-center-left'),
  center('center', 'center', 'align-center'),
  centerRight('center', 'flex-end', 'align-center-right'),
  bottomLeft('flex-end', 'flex-start', 'align-bottom-left'),
  bottomCenter('flex-end', 'center', 'align-bottom-center'),
  bottomRight('flex-end', 'flex-end', 'align-bottom-right');

  const Alignment(this.alignItems, this.justifyContent, this.className);
  final String alignItems;
  final String justifyContent;

  /// CSS class name from thor.css alignment utilities.
  final String className;

  @override
  String toStyle() =>
      'display: flex; align-items: $alignItems; justify-content: $justifyContent';
}
