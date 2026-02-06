import 'dart:html' as html;

import 'package:thor/src/renderers/nodes/element_node.dart';
import 'package:thor/src/renderers/nodes/node.dart';
import 'package:thor/src/renderers/nodes/text_node.dart';

class DomPatch {
  const DomPatch();

  html.Node patch(Node oldNode, Node newNode, html.Node domNode) {
    // Replace if type changes
    if (oldNode.runtimeType != newNode.runtimeType) {
      final newDom = _createDom(newNode);
      domNode.replaceWith(newDom);
      return newDom;
    }

    if (oldNode is TextNode && newNode is TextNode) {
      final textDom = domNode as html.Text;
      if (oldNode.text != newNode.text) {
        textDom.text = newNode.text;
      }
      return domNode;
    }

    final oldElNode = oldNode as ElementNode;
    final newElNode = newNode as ElementNode;

    // Change tag -> replace
    if (oldElNode.tag != newElNode.tag) {
      final newDom = _createDom(newNode);
      domNode.replaceWith(newDom);
      return newDom;
    }

    final el = domNode as html.Element;

    _patchAttributes(el, oldElNode.attributes, newElNode.attributes);
    _patchChildren(el, oldElNode.children, newElNode.children);

    return domNode;
  }

  html.Node _createDom(Node node) {
    switch (node) {
      case TextNode(:final text):
        return html.Text(text);

      case ElementNode(:final tag, :final attributes, :final children):
        final el = html.Element.tag(tag);
        attributes.forEach(el.setAttribute);
        for (final child in children) {
          el.append(_createDom(child));
        }
        return el;
      default:
        throw UnsupportedError('Unknown node type: $node');
    }
  }

  void _patchAttributes(
    html.Element el,
    Map<String, String> oldAttrs,
    Map<String, String> newAttrs,
  ) {
    for (final key in oldAttrs.keys) {
      if (!newAttrs.containsKey(key)) {
        el.attributes.remove(key);
      }
    }

    newAttrs.forEach((key, value) {
      if (oldAttrs[key] != value) {
        el.setAttribute(key, value);
      }
    });
  }

  void _patchChildren(
    html.Element el,
    List<Node> oldChildren,
    List<Node> newChildren,
  ) {
    final domChildren = el.childNodes;

    final common = oldChildren.length < newChildren.length
        ? oldChildren.length
        : newChildren.length;

    for (var i = 0; i < common; i++) {
      patch(oldChildren[i], newChildren[i], domChildren[i]);
    }

    // Add new children
    if (newChildren.length > oldChildren.length) {
      for (var i = oldChildren.length; i < newChildren.length; i++) {
        el.append(_createDom(newChildren[i]));
      }
    }

    // Remove old children
    if (oldChildren.length > newChildren.length) {
      for (var i = oldChildren.length - 1; i >= newChildren.length; i--) {
        el.childNodes[i].remove();
      }
    }
  }
}
