import 'package:thor/src/components/component.dart';
import 'package:thor/src/components/stateless_component.dart';
import 'package:thor/src/core/build_context.dart';
import 'package:thor/src/renderers/nodes/element_node.dart';

/// Convenience base for stateless components that produce a single HTML element
/// with attributes and children.
abstract class ElementComponent extends StatelessComponent {
  const ElementComponent({super.key});

  String get tag;
  Map<String, String> get attrs => const {};
  List<Component> get children => const [];

  @override
  Component build(BuildContext context) =>
      ElementNode(tag: tag, attributes: attrs, children: children);
}
