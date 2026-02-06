import 'dart:html' as html;

import 'package:thor/src/components/component.dart';
import 'package:thor/src/components/inherited_component.dart';
import 'package:thor/src/core/build_context.dart';
import 'package:thor/src/core/enums/breakpoint.dart';
import 'package:thor/src/core/models/size.dart';
import 'package:thor/src/elements/inherited_element.dart';
import 'package:thor/src/renderers/nodes/node.dart';
import 'package:thor/src/runtime/thor_runtime.dart';

/// Base class for all elements in the Thor element tree.
///
/// An element is the mutable, runtime instantiation of a [Component].
/// It manages lifecycle, dirty tracking, and provides [BuildContext].
abstract class ThorElement implements BuildContext {
  ThorElement(this.currentComponent);

  Component currentComponent;
  Component get component => currentComponent;

  ThorElement? parentElement;
  ThorElement? get parent => parentElement;

  ThorRuntime? runtimeRef;
  ThorRuntime get runtime => runtimeRef!;

  bool isMounted = false;
  bool get mounted => isMounted;

  bool isDirty = false;
  bool get dirty => isDirty;

  int elementDepth = 0;
  int get depth => elementDepth;

  // ---- BuildContext implementation ----

  @override
  Breakpoint get breakpoint => runtime.breakpoint;

  @override
  Size get size => runtime.size;

  @override
  T? dependOn<T extends InheritedComponent>() {
    final inherited = findInheritedElement<T>();
    if (inherited != null) {
      inherited.addDependent(this);
      return inherited.component as T;
    }
    return null;
  }

  @override
  T? findAncestor<T extends InheritedComponent>() {
    final inherited = findInheritedElement<T>();
    return inherited?.component as T?;
  }

  InheritedElement? findInheritedElement<T extends InheritedComponent>() {
    ThorElement? current = parentElement;
    while (current != null) {
      if (current is InheritedElement && current.component is T) {
        return current;
      }
      current = current.parentElement;
    }
    return null;
  }

  // ---- Lifecycle ----

  /// Attach this element to the tree.
  void mount(ThorElement? parent, ThorRuntime runtime) {
    parentElement = parent;
    runtimeRef = runtime;
    elementDepth = parent != null ? parent.elementDepth + 1 : 0;
    isMounted = true;
  }

  /// Update this element with a new component of the same type.
  void update(covariant Component newComponent) {
    currentComponent = newComponent;
  }

  /// Mark this element as needing a rebuild.
  void markDirty() {
    if (isDirty) return;
    isDirty = true;
    runtime.scheduleBuild(this);
  }

  /// Perform the rebuild. Subclasses implement the actual logic.
  void performRebuild();

  /// Remove this element from the tree and release references.
  void unmount() {
    isMounted = false;
    parentElement = null;
    runtimeRef = null;
  }

  /// Reconcile a child slot: given an old element (nullable) and a new node,
  /// return the element to use for that slot.
  ThorElement? updateChild(ThorElement? oldChild, Node? newNode) {
    if (newNode == null) {
      if (oldChild != null) {
        oldChild.unmount();
      }
      return null;
    }
    if (oldChild != null) {
      if (oldChild.component.canUpdate(newNode)) {
        oldChild.update(newNode);
        return oldChild;
      }
      oldChild.unmount();
    }
    return inflateNode(newNode);
  }

  /// Create a new element subtree from a node.
  ThorElement inflateNode(Node node) {
    final element = node.createElement();
    element.mount(this, runtime);
    return element;
  }

  // ---- DOM access ----

  /// Collect all DOM nodes produced by this element and its subtree.
  void visitDomNodes(void Function(html.Node domNode) visitor);
}
