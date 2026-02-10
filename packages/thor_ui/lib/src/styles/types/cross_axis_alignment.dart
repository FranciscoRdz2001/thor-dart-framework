import 'package:thor/thor.dart';

enum CrossAxisAlignment with ToStyleMixin {
  start('.cross-axis-start'),
  end('.cross-axis-end'),
  center('.cross-axis-center'),
  stretch('.cross-axis-stretch'),
  baseline('.cross-axis-baseline');

  const CrossAxisAlignment(this.value);
  final String value;

  @override
  String toStyle() => value;
}
