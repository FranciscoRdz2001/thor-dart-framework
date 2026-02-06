import 'package:thor/src/components/component.dart';
import 'package:thor/src/core/build_context.dart';
import 'package:thor/src/elements/stateless_element.dart';
import 'package:thor/src/elements/thor_element.dart';

/// A component that has no mutable state.
/// Rebuilds only when the parent provides a new instance.
abstract class StatelessComponent extends Component {
  const StatelessComponent({super.key});

  /// Describes the UI for this component.
  Component build(BuildContext context);

  @override
  ThorElement createElement() => StatelessElement(this);
}
