import 'package:thor/src/components/stateless_component.dart';
import 'package:thor/src/core/build_context.dart';
import 'package:thor/src/core/key.dart';
import 'package:thor/src/renderers/nodes/element_node.dart';
import 'package:thor/src/renderers/nodes/node.dart';

/// Convenience base for stateless components that produce a single HTML element
/// with attributes and children.
abstract class ElementComponent extends StatelessComponent {
  const ElementComponent({Key? key}) : super(key: key);

  String get tag;
  Map<String, String> get attrs => const {};
  List<Node> get children => const [];

  @override
  Node build(BuildContext context) => ElementNode(
        tag: tag,
        attributes: attrs,
        children: children,
      );
}
