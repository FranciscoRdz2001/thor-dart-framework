import 'dart:html' as html;

import 'package:thor/src/components/component.dart';
import 'package:thor/src/elements/thor_element.dart';
import 'package:thor/src/renderers/nodes/text_node.dart';
import 'package:thor/src/runtime/thor_runtime.dart';

/// Element that wraps a [TextNode] and manages a DOM [html.Text] node.
class TextElement extends ThorElement {
  TextElement(TextNode super.component);

  html.Text? _domNode;

  @override
  void mount(ThorElement? parent, ThorRuntime runtime) {
    super.mount(parent, runtime);
    _domNode = html.Text((component as TextNode).text);
  }

  @override
  void performRebuild() {
    isDirty = false;
  }

  @override
  void update(covariant Component newComponent) {
    final oldText = (component as TextNode).text;
    super.update(newComponent);
    final newText = (component as TextNode).text;
    if (oldText != newText) {
      _domNode!.text = newText;
    }
  }

  @override
  void unmount() {
    _domNode?.remove();
    super.unmount();
  }

  @override
  void visitDomNodes(void Function(html.Node domNode) visitor) {
    if (_domNode != null) {
      visitor(_domNode!);
    }
  }
}
