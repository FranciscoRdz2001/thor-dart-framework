import 'package:thor/thor.dart';

enum OverscrollBehavior with ToStyleMixin {
  auto('auto'),
  contain('contain'),
  none('none');

  const OverscrollBehavior(this.value);
  final String value;

  @override
  String toStyle() => value;
}
