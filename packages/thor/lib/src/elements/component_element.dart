import 'dart:html' as html;

import 'package:thor/src/components/component.dart';
import 'package:thor/src/elements/thor_element.dart';
import 'package:thor/src/renderers/nodes/component_node.dart';
import 'package:thor/src/runtime/thor_runtime.dart';

/// Element that bridges a [ComponentNode] to the [Component] it wraps.
///
/// On mount, it creates the appropriate element for the inner component
/// and delegates all operations to it.
class ComponentNodeElement extends ThorElement {
  ComponentNodeElement(ComponentNode super.node);

  ThorElement? _inner;

  @override
  void mount(ThorElement? parent, ThorRuntime runtime) {
    super.mount(parent, runtime);
    final cn = component as ComponentNode;
    _inner = cn.component.createElement();
    _inner!.mount(this, runtime);
  }

  @override
  void performRebuild() {
    isDirty = false;
    _inner?.performRebuild();
  }

  @override
  void update(covariant Component newComponent) {
    final oldCN = component as ComponentNode;
    final newCN = newComponent as ComponentNode;
    super.update(newComponent);

    if (oldCN.component.canUpdate(newCN.component)) {
      _inner!.update(newCN.component);
    } else {
      _inner?.unmount();
      _inner = newCN.component.createElement();
      _inner!.mount(this, runtime);
    }
  }

  @override
  void unmount() {
    _inner?.unmount();
    super.unmount();
  }

  @override
  void visitDomNodes(void Function(html.Node domNode) visitor) {
    _inner?.visitDomNodes(visitor);
  }
}
