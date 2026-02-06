import 'package:thor/src/components/stateless_component.dart';
import 'package:thor/src/core/build_context.dart';
import 'package:thor/src/renderers/nodes/node.dart';

/// Legacy renderer that directly calls component.build().
///
/// The element tree now handles rendering. This class is kept for
/// backward compatibility only.
@Deprecated('Use ThorRuntime and the element tree instead')
class ThorRenderer {
  const ThorRenderer();

  Node render(StatelessComponent root, BuildContext context) {
    return root.build(context);
  }
}
