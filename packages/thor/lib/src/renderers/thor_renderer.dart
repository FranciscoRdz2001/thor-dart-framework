import 'package:thor/src/components/web_component.dart';
import 'package:thor/src/core/build_context.dart';
import 'package:thor/src/renderers/nodes/node.dart';

class ThorRenderer {
  const ThorRenderer();
  Node render(WebComponent root, BuildContext context) {
    return root.build(context);
  }
}
