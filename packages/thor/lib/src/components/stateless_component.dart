import 'package:thor/src/components/component.dart';
import 'package:thor/src/core/build_context.dart';
import 'package:thor/src/elements/stateless_element.dart';
import 'package:thor/src/elements/thor_element.dart';
import 'package:thor/src/styles/style_class.dart';

/// A component that has no mutable state.
/// Rebuilds only when the parent provides a new instance.
abstract class StatelessComponent extends Component {
  const StatelessComponent({
    super.key,
    this.styleClasses = const [],
  });

  /// CSS classes to apply to the root DOM element of this component.
  ///
  /// These are [StyleClass] references that were registered via a
  /// [ThorStyleSheet] or [componentStyles]. Only the class name is
  /// added to the DOM — the CSS rules live in the injected `<style>` tag.
  final List<StyleClass> styleClasses;

  /// Override to declare [StyleClass] definitions scoped to this component type.
  ///
  /// Styles returned here are registered lazily on first build and cached
  /// per component type, so the cost is paid only once.
  ///
  /// ```dart
  /// class MyCard extends StatelessComponent {
  ///   static final cardStyle = StyleClass('my-card', css([
  ///     DecorationStyle(borderRadius: 8.px),
  ///   ]));
  ///
  ///   @override
  ///   List<StyleClass> get componentStyles => [cardStyle];
  /// }
  /// ```
  List<StyleClass> get componentStyles => const [];

  /// Describes the UI for this component.
  Component build(BuildContext context);

  @override
  ThorElement createElement() => StatelessElement(this);
}
