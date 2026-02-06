import 'package:thor/src/components/component.dart';
import 'package:thor/src/components/stateless_component.dart';
import 'package:thor/src/core/build_context.dart';
import 'package:thor/src/renderers/nodes/element_node.dart';

/// Convenience base for stateless components that produce an HTML element
/// with multiple children.
abstract class MultiChildElementComponent extends StatelessComponent {
  const MultiChildElementComponent({super.key});

  String get tag;
  Map<String, String> get attrs => const {};
  List<Component> get children;

  @override
  Component build(BuildContext context) {
    return ElementNode(tag: tag, attributes: attrs, children: children);
  }
}
