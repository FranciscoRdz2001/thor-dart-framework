import 'dart:html' as html;

import 'package:thor/src/components/component.dart';
import 'package:thor/src/core/enums/breakpoint.dart';
import 'package:thor/src/core/models/size.dart';
import 'package:thor/src/runtime/thor_runtime.dart';
import 'package:thor/src/styles/style_registry.dart';
import 'package:thor/src/styles/thor_style_sheet.dart';

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
    this.styleSheets = const [],
  }) : _runtime = ThorRuntime(
         container: container,
         breakpoint: breakpoint,
         size: size,
       );

  final Component root;
  final html.Element container;
  final ThorRuntime _runtime;

  /// Global [ThorStyleSheet] definitions to register before the first render.
  ///
  /// CSS rules are injected into a `<style>` tag in `<head>` once, before
  /// the component tree is mounted.
  final List<ThorStyleSheet> styleSheets;

  /// Mount the root component and render the initial DOM.
  void start() {
    // Inject global style sheets before mounting so every component can
    // reference CSS classes from the very first render.
    if (styleSheets.isNotEmpty) {
      StyleRegistry.instance.register(styleSheets);
      StyleRegistry.instance.inject();
    }

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
