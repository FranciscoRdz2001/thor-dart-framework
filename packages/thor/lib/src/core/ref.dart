import 'dart:html' as html;

/// Holds a reference to a mounted DOM element.
/// Used to imperatively access DOM nodes from State objects.
class Ref<T extends html.Element> {
  T? _current;

  T? get current => _current;

  /// Called internally by the runtime when the DOM node is mounted/updated.
  void attach(T element) {
    _current = element;
  }

  /// Called internally by the runtime when the DOM node is unmounted.
  void detach() {
    _current = null;
  }
}
