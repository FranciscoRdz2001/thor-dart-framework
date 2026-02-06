import 'package:thor/src/components/component.dart';
import 'package:thor/src/core/key.dart';
import 'package:thor/src/elements/thor_element.dart';

/// Base class for virtual DOM nodes.
///
/// Nodes extend [Component] so they can participate in the element tree
/// directly. Each node type knows how to create its corresponding element.
abstract class Node extends Component {
  const Node({Key? key}) : super(key: key);

  @override
  ThorElement createElement();
}
