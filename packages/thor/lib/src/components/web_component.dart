import 'package:thor/src/components/stateless_component.dart';
import 'package:thor/src/core/key.dart';

/// Legacy base class for components.
///
/// Use [StatelessComponent] or [StatefulComponent] instead.
@Deprecated('Use StatelessComponent or StatefulComponent instead')
abstract class WebComponent extends StatelessComponent {
  const WebComponent({Key? key}) : super(key: key);

  String get tag;
}
