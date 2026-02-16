import 'package:thor/src/components/component.dart';
import 'package:thor/src/components/stateless_component.dart';
import 'package:thor/src/core/build_context.dart';
import 'package:thor/src/renderers/nodes/element_node.dart';

/// Convenience base for stateless components that produce a leaf HTML element
/// (no children).
abstract class LeafElementComponent extends StatelessComponent {
  const LeafElementComponent({
    super.key,
    super.styleClasses,
  });

  String get tag;
  Map<String, String> get attrs => const {};

  @override
  Component build(BuildContext context) {
    return ElementNode(tag: tag, attributes: attrs);
  }
}
