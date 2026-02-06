import 'package:thor/src/components/stateless_component.dart';
import 'package:thor/src/core/key.dart';
import 'package:thor/src/renderers/nodes/node.dart';

/// Convenience base for stateless components that have an optional single child.
abstract class SingleChildElementComponent extends StatelessComponent {
  const SingleChildElementComponent({Key? key, this.child}) : super(key: key);

  final Node? child;

  List<Node> get children => child == null ? const [] : [child!];
}
