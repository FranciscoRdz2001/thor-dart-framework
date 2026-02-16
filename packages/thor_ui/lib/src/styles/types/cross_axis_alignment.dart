import 'package:thor/thor.dart';

enum CrossAxisAlignment with ToStyleMixin {
  start('flex-start'),
  end('flex-end'),
  center('center'),
  stretch('stretch'),
  baseline('baseline');

  const CrossAxisAlignment(this.value);
  final String value;

  @override
  String toStyle() => value;
}
