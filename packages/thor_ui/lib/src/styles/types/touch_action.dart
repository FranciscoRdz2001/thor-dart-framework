import 'package:thor/thor.dart';

enum TouchAction with ToStyleMixin {
  auto('auto'),
  none('none'),
  panX('pan-x'),
  panY('pan-y'),
  panLeft('pan-left'),
  panRight('pan-right'),
  panUp('pan-up'),
  panDown('pan-down'),
  pinchZoom('pinch-zoom'),
  manipulation('manipulation');

  const TouchAction(this.value);
  final String value;

  @override
  String toStyle() => value;
}
