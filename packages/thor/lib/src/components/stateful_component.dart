import 'package:thor/src/components/component.dart';
import 'package:thor/src/components/state.dart';
import 'package:thor/src/core/key.dart';
import 'package:thor/src/elements/stateful_element.dart';
import 'package:thor/src/elements/thor_element.dart';

/// A component that has mutable state managed by a [State] object.
abstract class StatefulComponent extends Component {
  const StatefulComponent({Key? key}) : super(key: key);

  /// Factory method to create the State instance for this component.
  State createState();

  @override
  ThorElement createElement() => StatefulElement(this);
}
