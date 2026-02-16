import 'dart:html' as html;

import 'package:thor/src/styles/style_class.dart';
import 'package:thor/src/styles/thor_style_sheet.dart';

/// Singleton registry that collects [StyleClass] definitions and injects
/// a single `<style>` element into `<head>`.
///
/// Designed for two usage patterns:
///
/// 1. **Global styles** — registered once at startup via [register] + [inject],
///    called by [DomTarget] before mounting the component tree.
///
/// 2. **Component-scoped styles** — registered lazily on first build via
///    [registerAndInject], cached per component type so the cost is paid
///    only once.
class StyleRegistry {
  StyleRegistry._();

  static final instance = StyleRegistry._();

  final Map<String, StyleClass> _styles = {};
  html.StyleElement? _styleElement;

  /// Register all styles from the given [sheets] without injecting yet.
  void register(List<ThorStyleSheet> sheets) {
    for (final sheet in sheets) {
      for (final style in sheet.styles) {
        _styles[style.className] = style;
      }
    }
  }

  /// Inject (or re-inject) the accumulated CSS into a `<style>` tag in `<head>`.
  void inject() {
    final css = _styles.values.map((s) => s.cssRule).join('\n');

    if (_styleElement != null) {
      // Update existing element in place.
      _styleElement!.text = css;
    } else {
      _styleElement = html.StyleElement()..text = css;
      html.document.head!.append(_styleElement!);
    }
  }

  /// Register a list of [StyleClass] and re-inject only if new classes were
  /// added. Safe to call many times — duplicate classNames are skipped.
  void registerAndInject(List<StyleClass> styles) {
    var hasNew = false;
    for (final style in styles) {
      if (!_styles.containsKey(style.className)) {
        _styles[style.className] = style;
        hasNew = true;
      }
    }
    if (hasNew) inject();
  }
}
