import 'package:thor/src/components/stateful_component.dart';
import 'package:thor/src/core/build_context.dart';
import 'package:thor/src/elements/stateful_element.dart';
import 'package:thor/src/renderers/nodes/node.dart';

/// Mutable state for a [StatefulComponent].
///
/// Lifecycle order: [initState] -> [didMount] -> [didUpdate]* -> [dispose]
abstract class State<T extends StatefulComponent> {
  /// The element that owns this state. Set by the runtime.
  late StatefulElement elementRef;

  /// The component configuration. Updated by the runtime on rebuild.
  T get component => elementRef.component as T;

  /// The build context from the element tree.
  BuildContext get context => elementRef;

  /// Whether this state is still mounted in the tree.
  bool get mounted => elementRef.mounted;

  /// Called once when the element is first inserted into the tree.
  /// Safe to read [component]. Do NOT call [setState] here.
  void initState() {}

  /// Called after the element and its subtree are fully mounted in the DOM.
  /// Safe to call [setState], access refs, or start async operations.
  void didMount() {}

  /// Called when the parent rebuilds and provides a new component instance
  /// of the same runtimeType and key.
  void didUpdate(covariant T oldComponent) {}

  /// Called when the element is permanently removed from the tree.
  /// Cancel subscriptions, timers, etc. Do NOT call [setState] after this.
  void dispose() {}

  /// Schedules a rebuild for this component. The [fn] callback mutates state
  /// synchronously, then the runtime batches and applies the rebuild.
  void setState(void Function() fn) {
    if (!mounted) return;
    fn();
    elementRef.markDirty();
  }

  /// Describes the UI for this component given the current state.
  Node build(BuildContext context);
}
