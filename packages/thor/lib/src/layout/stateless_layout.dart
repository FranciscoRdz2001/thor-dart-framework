import 'package:thor/src/components/component.dart';
import 'package:thor/src/core/build_context.dart';

@Deprecated('Use StatelessComponent directly')
abstract class StatelessLayout {
  Component build(BuildContext context);
}
