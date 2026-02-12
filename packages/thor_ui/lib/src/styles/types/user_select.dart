import 'package:thor/thor.dart';

enum UserSelect with ToStyleMixin {
  auto('auto'),
  none('none'),
  text('text'),
  all('all'),
  contain('contain');

  const UserSelect(this.value);
  final String value;

  @override
  String toStyle() => value;
}
