import 'dart:html' as html;

import 'package:thor/src/components/component.dart';
import 'package:thor/src/components/stateless_component.dart';
import 'package:thor/src/elements/thor_element.dart';
import 'package:thor/src/runtime/thor_runtime.dart';

/// Element that wraps a [StatelessComponent].
/// Calls build() to get the child node tree, then inflates it.
class StatelessElement extends ThorElement {
  StatelessElement(StatelessComponent super.component);

  ThorElement? _child;

  @override
  void mount(ThorElement? parent, ThorRuntime runtime) {
    super.mount(parent, runtime);
    _rebuild();
  }

  @override
  void performRebuild() {
    isDirty = false;
    _rebuild();
  }

  void _rebuild() {
    final built = (component as StatelessComponent).build(this);
    _child = updateChild(_child, built);
  }

  @override
  void update(covariant Component newComponent) {
    super.update(newComponent);
    _rebuild();
  }

  @override
  void unmount() {
    _child?.unmount();
    super.unmount();
  }

  @override
  void visitDomNodes(void Function(html.Node domNode) visitor) {
    _child?.visitDomNodes(visitor);
  }
}
