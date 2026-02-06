import 'package:thor/src/core/enums/breakpoint.dart';
import 'package:thor/src/core/models/size.dart';

class BuildContext {
  final Breakpoint breakpoint;
  final Size size;

  const BuildContext({required this.breakpoint, required this.size});
}
