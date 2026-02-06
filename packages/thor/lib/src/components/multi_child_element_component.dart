import 'package:thor/src/components/stateless_component.dart';
import 'package:thor/src/core/build_context.dart';
import 'package:thor/src/core/key.dart';
import 'package:thor/src/renderers/nodes/element_node.dart';
import 'package:thor/src/renderers/nodes/node.dart';

/// Convenience base for stateless components that produce an HTML element
/// with multiple children.
abstract class MultiChildElementComponent extends StatelessComponent {
  const MultiChildElementComponent({Key? key}) : super(key: key);

  String get tag;
  Map<String, String> get attrs => const {};
  List<Node> get children;

  @override
  Node build(BuildContext context) {
    return ElementNode(
      tag: tag,
      attributes: attrs,
      children: children,
    );
  }
}
