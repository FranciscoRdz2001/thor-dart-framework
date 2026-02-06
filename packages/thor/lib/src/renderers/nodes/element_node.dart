import 'dart:html' as html;

import 'package:thor/src/components/component.dart';
import 'package:thor/src/core/event_handler.dart';
import 'package:thor/src/core/key.dart';
import 'package:thor/src/core/ref.dart';
import 'package:thor/src/elements/render_element.dart';
import 'package:thor/src/elements/thor_element.dart';
import 'package:thor/src/renderers/nodes/node.dart';

class ElementNode extends Node {
  final String tag;
  final Map<String, String> attributes;
  final Map<String, EventHandler> events;
  final List<Component> children;
  final Ref<html.Element>? ref;

  const ElementNode({
    Key? key,
    required this.tag,
    this.attributes = const {},
    this.events = const {},
    this.children = const [],
    this.ref,
  }) : super(key: key);

  @override
  ThorElement createElement() => RenderElement(this);

  @override
  bool canUpdate(Component other) {
    return other is ElementNode && other.tag == tag && other.key == key;
  }
}
