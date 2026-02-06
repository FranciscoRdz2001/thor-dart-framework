import 'package:thor/src/components/component.dart';
import 'package:thor/src/core/key.dart';
import 'package:thor/src/elements/component_element.dart';
import 'package:thor/src/elements/thor_element.dart';
import 'package:thor/src/renderers/nodes/node.dart';

/// A virtual DOM node that wraps a [Component].
///
/// When the element tree encounters a [ComponentNode] during reconciliation,
/// it inflates the inner component into its own [ThorElement] subtree.
/// This enables component nesting in the virtual DOM tree.
class ComponentNode extends Node {
  final Component component;

  ComponentNode(this.component, {Key? key}) : super(key: key ?? component.key);

  @override
  ThorElement createElement() => ComponentNodeElement(this);

  @override
  bool canUpdate(Component other) {
    if (other is! ComponentNode) return false;
    return component.canUpdate(other.component);
  }
}
