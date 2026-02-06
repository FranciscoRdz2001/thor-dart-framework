import 'package:thor/src/components/component.dart';
import 'package:thor/src/components/stateless_component.dart';
import 'package:thor/src/core/build_context.dart';

/// Legacy renderer that directly calls component.build().
///
/// The element tree now handles rendering. This class is kept for
/// backward compatibility only.
@Deprecated('Use ThorRuntime and the element tree instead')
class ThorRenderer {
  const ThorRenderer();

  Component render(StatelessComponent root, BuildContext context) {
    return root.build(context);
  }
}
