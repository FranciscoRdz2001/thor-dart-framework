import 'package:thor/thor.dart';

enum PointerEvents with ToStyleMixin {
  auto('auto'),
  none('none'),
  visiblePainted('visiblePainted'),
  visibleFill('visibleFill'),
  visibleStroke('visibleStroke'),
  visible('visible'),
  painted('painted'),
  fill('fill'),
  stroke('stroke'),
  all('all');

  const PointerEvents(this.value);
  final String value;

  @override
  String toStyle() => value;
}
