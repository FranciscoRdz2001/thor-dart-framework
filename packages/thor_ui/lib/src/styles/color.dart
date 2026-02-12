import 'package:thor/thor.dart';

class Color with ToStyleMixin {
  final String value;

  const Color(this.value);

  const Color.hex(String hex) : value = '#$hex';

  Color.rgb(int r, int g, int b) : value = 'rgb($r, $g, $b)';

  Color.rgba(int r, int g, int b, double a) : value = 'rgba($r, $g, $b, $a)';

  static const transparent = Color('transparent');
  static const black = Color('#000000');
  static const white = Color('#FFFFFF');
  static const red = Color('#FF0000');
  static const green = Color('#00FF00');
  static const blue = Color('#0000FF');
  static const grey = Color('#808080');
  static const lightGrey = Color('#D3D3D3');
  static const darkGrey = Color('#404040');

  @override
  String toStyle() => value;  
}
