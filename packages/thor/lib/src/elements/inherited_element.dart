import 'dart:html' as html;

import 'package:thor/src/components/component.dart';
import 'package:thor/src/components/inherited_component.dart';
import 'package:thor/src/elements/thor_element.dart';
import 'package:thor/src/runtime/thor_runtime.dart';

/// Element that wraps an [InheritedComponent] and tracks dependents.
///
/// When the inherited data changes, all dependent elements are marked dirty
/// so they rebuild with the new data.
class InheritedElement extends ThorElement {
  InheritedElement(InheritedComponent super.component);

  final Set<ThorElement> _dependents = {};
  ThorElement? _child;

  void addDependent(ThorElement dependent) {
    _dependents.add(dependent);
  }

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
    final node = (component as InheritedComponent).child;
    _child = updateChild(_child, node);
  }

  @override
  void update(covariant Component newComponent) {
    final oldComponent = component as InheritedComponent;
    super.update(newComponent);
    final newComp = component as InheritedComponent;

    if (newComp.updateShouldNotify(oldComponent)) {
      // Remove stale dependents before notifying
      _dependents.removeWhere((dep) => !dep.mounted);
      for (final dep in _dependents) {
        dep.markDirty();
      }
    }

    _rebuild();
  }

  @override
  void unmount() {
    _dependents.clear();
    _child?.unmount();
    super.unmount();
  }

  @override
  void visitDomNodes(void Function(html.Node domNode) visitor) {
    _child?.visitDomNodes(visitor);
  }
}
