import 'dart:html' as html;

import 'package:thor/src/components/component.dart';
import 'package:thor/src/components/error_boundary.dart';
import 'package:thor/src/components/stateful_component.dart';
import 'package:thor/src/components/state.dart';
import 'package:thor/src/elements/thor_element.dart';
import 'package:thor/src/renderers/nodes/node.dart';
import 'package:thor/src/renderers/nodes/text_node.dart';
import 'package:thor/src/runtime/thor_runtime.dart';

/// Element that wraps a [StatefulComponent] and manages its [State].
///
/// Handles state creation, lifecycle hooks, and error propagation
/// to the nearest [ErrorBoundary].
class StatefulElement extends ThorElement {
  StatefulElement(StatefulComponent super.component);

  late State _state;
  State get state => _state;

  ThorElement? _child;

  @override
  void mount(ThorElement? parent, ThorRuntime runtime) {
    super.mount(parent, runtime);
    _state = (component as StatefulComponent).createState();
    _state.elementRef = this;
    _state.initState();
    _rebuild();
    // didMount is called after the DOM is ready
    runtime.schedulePostMountCallback(() {
      if (mounted) _state.didMount();
    });
  }

  @override
  void performRebuild() {
    isDirty = false;
    _rebuild();
  }

  void _rebuild() {
    Node built;
    try {
      built = _state.build(this);
    } catch (error, stackTrace) {
      built = _handleBuildError(error, stackTrace);
    }
    _child = updateChild(_child, built);
  }

  @override
  void update(covariant Component newComponent) {
    final oldComponent = component as StatefulComponent;
    super.update(newComponent);
    _state.didUpdate(oldComponent);
    _rebuild();
  }

  @override
  void unmount() {
    _state.dispose();
    _child?.unmount();
    super.unmount();
  }

  Node _handleBuildError(Object error, StackTrace stackTrace) {
    // Walk up to find ErrorBoundary element
    ThorElement? current = parent;
    while (current != null) {
      if (current is StatefulElement &&
          current.state is ErrorBoundaryState) {
        (current.state as ErrorBoundaryState).onError(error, stackTrace);
        return const TextNode('');
      }
      current = current.parent;
    }
    // No error boundary found — rethrow
    throw error;
  }

  @override
  void visitDomNodes(void Function(html.Node domNode) visitor) {
    _child?.visitDomNodes(visitor);
  }
}
