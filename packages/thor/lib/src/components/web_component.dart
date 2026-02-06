import 'package:thor/src/core/build_context.dart';
import 'package:thor/src/renderers/nodes/node.dart';

abstract class WebComponent {
  String get tag;

  const WebComponent();

  Node build(BuildContext context);
}
