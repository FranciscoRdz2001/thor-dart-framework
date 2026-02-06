import 'dart:async';
import 'dart:html' as html;

import 'package:thor/src/components/component.dart';
import 'package:thor/src/core/enums/breakpoint.dart';
import 'package:thor/src/core/models/size.dart';
import 'package:thor/src/elements/thor_element.dart';
import 'package:thor/src/renderers/nodes/component_node.dart';

/// The Thor reactive runtime.
///
/// Manages the element tree, schedules rebuilds using microtask batching,
/// and coordinates DOM updates. This is the central coordinator that makes
/// the framework reactive.
class ThorRuntime {
  ThorRuntime({
    required this.container,
    required Breakpoint breakpoint,
    required Size size,
  })  : _breakpoint = breakpoint,
        _size = size;

  final html.Element container;

  Breakpoint _breakpoint;
  Breakpoint get breakpoint => _breakpoint;

  Size _size;
  Size get size => _size;

  ThorElement? _rootElement;

  // ---- Dirty tracking ----

  final Set<ThorElement> _dirtyElements = {};
  bool _buildScheduled = false;

  // ---- Post-mount callbacks ----

  final List<void Function()> _postMountCallbacks = [];

  /// Mount the root component into the container.
  void mount(Component rootComponent) {
    container.children.clear();

    final rootNode = ComponentNode(rootComponent);
    _rootElement = rootNode.createElement();
    _rootElement!.mount(null, this);

    _rootElement!.visitDomNodes((domNode) {
      container.append(domNode);
    });

    _flushPostMountCallbacks();
  }

  /// Called by [ThorElement.markDirty].
  void scheduleBuild(ThorElement element) {
    _dirtyElements.add(element);
    if (!_buildScheduled) {
      _buildScheduled = true;
      scheduleMicrotask(_performBuildPass);
    }
  }

  void _performBuildPass() {
    _buildScheduled = false;

    // Fast path: single dirty element (most common case after setState)
    if (_dirtyElements.length == 1) {
      final element = _dirtyElements.first;
      _dirtyElements.clear();
      if (element.mounted && element.dirty) {
        element.performRebuild();
      }
    } else {
      // Sort dirty elements by depth (parents first) to avoid double-rebuilds.
      final sorted = _dirtyElements.toList()
        ..sort((a, b) => a.depth.compareTo(b.depth));
      _dirtyElements.clear();

      for (final element in sorted) {
        if (element.mounted && element.dirty) {
          element.performRebuild();
        }
      }
    }

    _flushPostMountCallbacks();
  }

  /// Schedule a callback to run after the current mount/rebuild pass.
  void schedulePostMountCallback(void Function() callback) {
    _postMountCallbacks.add(callback);
  }

  void _flushPostMountCallbacks() {
    final callbacks = List.of(_postMountCallbacks);
    _postMountCallbacks.clear();
    for (final cb in callbacks) {
      cb();
    }
  }

  /// Update viewport information and trigger rebuilds for responsive components.
  void updateViewport(Breakpoint breakpoint, Size size) {
    _breakpoint = breakpoint;
    _size = size;
    _rootElement?.markDirty();
  }

  /// Tear down the entire element tree.
  void dispose() {
    _rootElement?.unmount();
    _rootElement = null;
    container.children.clear();
  }
}
