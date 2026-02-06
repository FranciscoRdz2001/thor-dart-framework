import 'dart:html' as html;

import 'package:thor/src/targets/dom/dom_patch.dart';
import 'nodes/node.dart';
import 'nodes/text_node.dart';
import 'nodes/element_node.dart';

/// Legacy DOM renderer that converts Nodes to DOM and patches.
///
/// The element tree (RenderElement) now handles DOM creation and patching.
/// This class is kept for backward compatibility only.
@Deprecated('Use ThorRuntime and the element tree instead')
class DomRenderer {
  const DomRenderer();

  final DomPatch _patcher = const DomPatch();

  html.Node createDom(Node node) {
    switch (node) {
      case TextNode(:final text):
        return html.Text(text);
      case ElementNode(:final tag, :final attributes, :final children):
        final el = html.Element.tag(tag);
        attributes.forEach(el.setAttribute);
        for (final child in children) {
          el.append(createDom(child));
        }
        return el;
      default:
        throw UnsupportedError('Unknown node type: $node');
    }
  }

  html.Node mount(Node node, html.Element container) {
    container.children.clear();
    final root = createDom(node);
    container.append(root);
    return root;
  }

  html.Node patch(Node oldNode, Node newNode, html.Node domRoot) {
    return _patcher.patch(oldNode, newNode, domRoot);
  }
}
