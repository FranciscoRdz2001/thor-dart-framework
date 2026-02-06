import 'package:thor/src/core/models/to_style_mixin.dart';

class Unit with ToStyleMixin {
  final String name;
  final num value;

  const Unit(this.name, this.value);

  @override
  String toStyle() => '$value$name';
}
