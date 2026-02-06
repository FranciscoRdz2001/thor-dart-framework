import 'dart:html' as html;

import 'package:thor/src/components/component.dart';
import 'package:thor/src/core/enums/breakpoint.dart';
import 'package:thor/src/core/models/size.dart';
import 'package:thor/src/runtime/thor_runtime.dart';

/// Entry point for mounting a Thor app into a DOM container.
///
/// Creates a [ThorRuntime] that manages the element tree, scheduling,
/// and DOM updates.
class DomTarget {
  DomTarget({
    required this.root,
    required this.container,
    required Breakpoint breakpoint,
    required Size size,
  }) : _runtime = ThorRuntime(
          container: container,
          breakpoint: breakpoint,
          size: size,
        );

  final Component root;
  final html.Element container;
  final ThorRuntime _runtime;

  /// Mount the root component and render the initial DOM.
  void start() {
    _runtime.mount(root);
  }

  /// Update viewport information and trigger responsive rebuilds.
  void updateViewport(Breakpoint breakpoint, Size size) {
    _runtime.updateViewport(breakpoint, size);
  }

  /// Tear down the element tree and clean up the DOM.
  void dispose() {
    _runtime.dispose();
  }
}
