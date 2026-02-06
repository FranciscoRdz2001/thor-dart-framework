import 'package:thor/src/components/state.dart';
import 'package:thor/src/components/stateful_component.dart';
import 'package:thor/src/core/build_context.dart';
import 'package:thor/src/renderers/nodes/node.dart';
import 'package:thor/src/renderers/nodes/text_node.dart';

/// A component that catches errors during build of its child subtree
/// and displays a fallback UI instead of crashing the entire app.
class ErrorBoundary extends StatefulComponent {
  final Node child;
  final Node Function(Object error, StackTrace stackTrace)? fallbackBuilder;

  const ErrorBoundary({
    super.key,
    required this.child,
    this.fallbackBuilder,
  });

  @override
  State<ErrorBoundary> createState() => ErrorBoundaryState();
}

class ErrorBoundaryState extends State<ErrorBoundary> {
  Object? _error;
  StackTrace? _stackTrace;

  bool get hasError => _error != null;

  /// Called by the runtime when a descendant build() throws.
  void onError(Object error, StackTrace stackTrace) {
    setState(() {
      _error = error;
      _stackTrace = stackTrace;
    });
  }

  void reset() {
    setState(() {
      _error = null;
      _stackTrace = null;
    });
  }

  @override
  Node build(BuildContext context) {
    if (_error != null) {
      return component.fallbackBuilder?.call(_error!, _stackTrace!) ??
          TextNode('Error: $_error');
    }
    return component.child;
  }
}
