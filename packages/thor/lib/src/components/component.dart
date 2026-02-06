import 'package:thor/src/core/key.dart';
import 'package:thor/src/elements/thor_element.dart';

/// Base class for all Thor components.
///
/// Components are immutable descriptions of UI. They describe what to render,
/// but do not hold mutable state or DOM references. Each component knows how
/// to create its corresponding [ThorElement] via [createElement].
///
/// This mirrors Flutter's Widget base class.
abstract class Component {
  final Key? key;

  const Component({this.key});

  /// Creates the runtime element that manages this component's lifecycle.
  ThorElement createElement();

  /// Whether [other] can update an existing element of this component's type.
  /// Returns true if [other] is the same runtimeType and has the same key.
  bool canUpdate(Component other) {
    return runtimeType == other.runtimeType && key == other.key;
  }
}
