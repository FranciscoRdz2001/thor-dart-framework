import 'package:thor/thor.dart';

enum ScrollBehavior with ToStyleMixin {
  auto('auto'),
  smooth('smooth');

  const ScrollBehavior(this.value);
  final String value;

  @override
  String toStyle() => value;
}
