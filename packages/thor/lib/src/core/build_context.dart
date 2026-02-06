import 'package:thor/src/components/inherited_component.dart';
import 'package:thor/src/core/enums/breakpoint.dart';
import 'package:thor/src/core/models/size.dart';

/// The context passed to build methods. Provides access to:
/// - Viewport information (breakpoint, size)
/// - Inherited data lookup via [dependOn]
///
/// In practice, each [ThorElement] implements [BuildContext].
abstract class BuildContext {
  Breakpoint get breakpoint;
  Size get size;

  /// Look up the nearest ancestor [InheritedComponent] of type [T].
  /// Registers a dependency so this element rebuilds when [T] changes.
  T? dependOn<T extends InheritedComponent>();

  /// Look up inherited data without registering a dependency.
  T? findAncestor<T extends InheritedComponent>();
}
