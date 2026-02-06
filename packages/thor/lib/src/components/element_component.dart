import 'package:thor/src/components/web_component.dart';
import 'package:thor/src/core/build_context.dart';
import 'package:thor/src/renderers/nodes/element_node.dart';
import 'package:thor/src/renderers/nodes/node.dart';

abstract class ElementComponent extends WebComponent {
  const ElementComponent();

  @override
  String get tag;
  Map<String, String> get attrs => const {};
  List<WebComponent> get children => const [];

  @override
  Node build(BuildContext context) => ElementNode(
    tag: tag,
    attributes: attrs,
    children: children.map((c) => c.build(context)).toList(),
  );
}
