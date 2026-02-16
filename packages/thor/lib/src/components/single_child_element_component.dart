import 'package:thor/src/components/component.dart';
import 'package:thor/src/components/stateless_component.dart';

/// Convenience base for stateless components that have an optional single child.
abstract class SingleChildElementComponent extends StatelessComponent {
  const SingleChildElementComponent({
    super.key,
    super.styleClasses,
    this.child,
  });

  final Component? child;

  List<Component> get children => child == null ? const [] : [child!];
}
