import 'package:thor/src/components/component.dart';
import 'package:thor/src/core/key.dart';
import 'package:thor/src/elements/inherited_element.dart';
import 'package:thor/src/elements/thor_element.dart';
import 'package:thor/src/renderers/nodes/node.dart';

/// A component that propagates data down the element tree.
///
/// Descendants can look up the nearest ancestor [InheritedComponent] of a
/// specific type using [BuildContext.dependOn<T>()].
abstract class InheritedComponent extends Component {
  final Node child;

  const InheritedComponent({Key? key, required this.child}) : super(key: key);

  /// Whether dependents should be rebuilt when this component updates.
  /// Compare [this] to [oldComponent] and return true if data changed.
  bool updateShouldNotify(covariant InheritedComponent oldComponent);

  @override
  ThorElement createElement() => InheritedElement(this);
}
