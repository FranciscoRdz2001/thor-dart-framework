import 'package:thor/thor.dart';

enum Cursor with ToStyleMixin {
  auto('auto'),
  defaultCursor('default'),
  pointer('pointer'),
  wait('wait'),
  text('text'),
  move('move'),
  notAllowed('not-allowed'),
  crosshair('crosshair'),
  grab('grab'),
  grabbing('grabbing'),
  colResize('col-resize'),
  rowResize('row-resize'),
  zoomIn('zoom-in'),
  zoomOut('zoom-out'),
  none('none');

  const Cursor(this.value);
  final String value;

  @override
  String toStyle() => value;
}
