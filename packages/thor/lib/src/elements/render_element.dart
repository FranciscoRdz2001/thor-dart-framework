import 'dart:html' as html;

import 'package:thor/src/components/component.dart';
import 'package:thor/src/core/event_handler.dart';
import 'package:thor/src/core/key.dart';
import 'package:thor/src/elements/thor_element.dart';
import 'package:thor/src/renderers/nodes/element_node.dart';
import 'package:thor/src/renderers/nodes/node.dart';
import 'package:thor/src/runtime/thor_runtime.dart';

/// Stable wrapper that avoids removing/adding DOM listeners on every rebuild.
/// The DOM listener stays the same; only the inner handler swaps.
class _EventBinding {
  EventHandler handler;
  late final html.EventListener domListener;

  _EventBinding(this.handler) {
    domListener = (html.Event e) => handler(e);
  }
}

class RenderElement extends ThorElement {
  RenderElement(ElementNode super.component);

  html.Element? _domElement;
  html.Element get domElement => _domElement!;

  final Map<String, _EventBinding> _bindings = {};
  final List<ThorElement> _children = [];

  @override
  void mount(ThorElement? parent, ThorRuntime runtime) {
    super.mount(parent, runtime);
    final node = component as ElementNode;

    _domElement = html.Element.tag(node.tag);

    node.attributes.forEach(_domElement!.setAttribute);

    _attachEvents(node.events);

    node.ref?.attach(_domElement!);

    for (final childNode in node.children) {
      final childElement = inflateNode(childNode);
      _children.add(childElement);
      childElement.visitDomNodes((domNode) {
        _domElement!.append(domNode);
      });
    }
  }

  @override
  void performRebuild() {
    isDirty = false;
  }

  @override
  void update(covariant Component newComponent) {
    final oldNode = component as ElementNode;
    final newNode = newComponent as ElementNode;

    super.update(newComponent);

    _patchAttributes(oldNode.attributes, newNode.attributes);
    _patchEvents(oldNode.events, newNode.events);

    if (!identical(oldNode.ref, newNode.ref)) {
      oldNode.ref?.detach();
      newNode.ref?.attach(_domElement!);
    }

    _reconcileChildren(oldNode.children, newNode.children);
  }

  void _patchAttributes(
    Map<String, String> oldAttrs,
    Map<String, String> newAttrs,
  ) {
    // Skip if same instance (const maps)
    if (identical(oldAttrs, newAttrs)) return;

    for (final key in oldAttrs.keys) {
      if (!newAttrs.containsKey(key)) {
        _domElement!.attributes.remove(key);
      }
    }
    newAttrs.forEach((key, value) {
      if (oldAttrs[key] != value) {
        _domElement!.setAttribute(key, value);
      }
    });
  }

  /// First mount: attach all events.
  void _attachEvents(Map<String, EventHandler> events) {
    for (final entry in events.entries) {
      final binding = _EventBinding(entry.value);
      _bindings[entry.key] = binding;
      _domElement!.addEventListener(entry.key, binding.domListener);
    }
  }

  /// On update: swap handlers in stable bindings, add/remove only when
  /// event names change. No DOM remove/add when only the handler changed.
  void _patchEvents(
    Map<String, EventHandler> oldEvents,
    Map<String, EventHandler> newEvents,
  ) {
    if (identical(oldEvents, newEvents)) return;

    // Remove bindings for events no longer present
    final toRemove = <String>[];
    for (final name in _bindings.keys) {
      if (!newEvents.containsKey(name)) {
        toRemove.add(name);
      }
    }
    for (final name in toRemove) {
      final binding = _bindings.remove(name)!;
      _domElement!.removeEventListener(name, binding.domListener);
    }

    // Add or update bindings
    for (final entry in newEvents.entries) {
      final existing = _bindings[entry.key];
      if (existing != null) {
        // Swap handler — no DOM touch
        existing.handler = entry.value;
      } else {
        // New event
        final binding = _EventBinding(entry.value);
        _bindings[entry.key] = binding;
        _domElement!.addEventListener(entry.key, binding.domListener);
      }
    }
  }

  void _reconcileChildren(List<Node> oldNodes, List<Node> newNodes) {
    // Fast path: same instance (const children)
    if (identical(oldNodes, newNodes)) return;

    final hasKeys = _anyKeyed(newNodes) || _anyKeyed(oldNodes);

    if (hasKeys) {
      _reconcileKeyedChildren(oldNodes, newNodes);
    } else {
      _reconcileUnkeyedChildren(oldNodes, newNodes);
    }
  }

  static bool _anyKeyed(List<Node> nodes) {
    for (final n in nodes) {
      if (n.key != null) return true;
    }
    return false;
  }

  /// Simple index-based reconciliation (no keys). Zero allocations for maps.
  void _reconcileUnkeyedChildren(List<Node> oldNodes, List<Node> newNodes) {
    final commonLen =
        oldNodes.length < newNodes.length ? oldNodes.length : newNodes.length;

    // Update common range in place
    for (var i = 0; i < commonLen; i++) {
      final oldChild = _children[i];
      final newNode = newNodes[i];
      if (oldChild.component.canUpdate(newNode)) {
        oldChild.update(newNode);
      } else {
        oldChild.unmount();
        final created = inflateNode(newNode);
        _children[i] = created;
        // Replace in DOM
        oldChild.visitDomNodes((old) {
          created.visitDomNodes((neu) {
            old.replaceWith(neu);
          });
        });
      }
    }

    // Append new children
    if (newNodes.length > oldNodes.length) {
      for (var i = oldNodes.length; i < newNodes.length; i++) {
        final created = inflateNode(newNodes[i]);
        _children.add(created);
        created.visitDomNodes((domNode) {
          _domElement!.append(domNode);
        });
      }
    }

    // Remove excess children
    if (oldNodes.length > newNodes.length) {
      for (var i = oldNodes.length - 1; i >= newNodes.length; i--) {
        _children[i].unmount();
      }
      _children.removeRange(newNodes.length, _children.length);
    }
  }

  /// Key-based reconciliation for reorderable lists.
  void _reconcileKeyedChildren(List<Node> oldNodes, List<Node> newNodes) {
    final Map<Key, int> keyedOldIndices = {};
    final List<bool> oldUsed = List.filled(oldNodes.length, false);

    for (var i = 0; i < oldNodes.length; i++) {
      if (oldNodes[i].key != null) {
        keyedOldIndices[oldNodes[i].key!] = i;
      }
    }

    final List<ThorElement> newChildren = [];
    int unkeyedIndex = 0;

    for (final newNode in newNodes) {
      ThorElement? oldElement;

      if (newNode.key != null) {
        final oldIdx = keyedOldIndices.remove(newNode.key);
        if (oldIdx != null) {
          oldUsed[oldIdx] = true;
          oldElement = _children[oldIdx];
        }
      } else {
        while (unkeyedIndex < _children.length) {
          if (oldUsed[unkeyedIndex]) {
            unkeyedIndex++;
            continue;
          }
          final candidate = _children[unkeyedIndex];
          unkeyedIndex++;
          if (candidate.component.canUpdate(newNode)) {
            oldUsed[unkeyedIndex - 1] = true;
            oldElement = candidate;
            break;
          } else {
            oldUsed[unkeyedIndex - 1] = true;
            candidate.unmount();
          }
        }
      }

      final child = updateChild(oldElement, newNode);
      if (child != null) {
        newChildren.add(child);
      }
    }

    for (var i = 0; i < _children.length; i++) {
      if (!oldUsed[i]) {
        _children[i].unmount();
      }
    }

    _children
      ..clear()
      ..addAll(newChildren);

    // Reorder DOM only for keyed reconciliation
    for (final child in _children) {
      child.visitDomNodes((node) {
        _domElement!.append(node);
      });
    }
  }

  @override
  void unmount() {
    final node = component as ElementNode;
    node.ref?.detach();
    for (final child in _children) {
      child.unmount();
    }
    _children.clear();

    // Remove all DOM event listeners
    for (final entry in _bindings.entries) {
      _domElement?.removeEventListener(entry.key, entry.value.domListener);
    }
    _bindings.clear();

    _domElement?.remove();
    _domElement = null;

    super.unmount();
  }

  @override
  void visitDomNodes(void Function(html.Node domNode) visitor) {
    if (_domElement != null) {
      visitor(_domElement!);
    }
  }
}
