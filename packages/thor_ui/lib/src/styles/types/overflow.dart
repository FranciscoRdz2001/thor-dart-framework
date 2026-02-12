import 'package:thor/thor.dart';

enum Overflow with ToStyleMixin {
  visible('visible'),
  hidden('hidden'),
  scroll('scroll'),
  auto('auto'),
  clip('clip');

  const Overflow(this.value);
  final String value;

  @override
  String toStyle() => value;
}
