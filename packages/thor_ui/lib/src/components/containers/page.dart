import 'dart:html' as html;

import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';

/// A scaffold-like component that controls the global page appearance.
///
/// Instead of rendering a wrapper `div`, [Page] applies styles directly
/// to `document.body` and the `<html>` element (background color, padding,
/// color scheme) and renders its [child] in a full-viewport container.
class Page extends StatelessComponent {
  final Color? backgroundColor;
  final SpacingStyle? spacing;
  final Brightness brightness;
  final Component? child;

  const Page({
    super.key,
    this.backgroundColor,
    this.spacing,
    this.brightness = Brightness.light,
    this.child,
  });

  @override
  Component build(BuildContext context) {
    _applyGlobalStyles();

    final styles = <String>[
      'min-height: 100vh',
      'width: 100%',
      if (spacing != null) spacing!.toCss(),
    ].where((s) => s.isNotEmpty).join('; ');

    return ElementNode(
      tag: 'main',
      attributes: {
        'class': 'page',
        'style': styles,
      },
      children: child != null ? [child!] : [],
    );
  }

  void _applyGlobalStyles() {
    final body = html.document.body;
    final root = html.document.documentElement;

    if (body == null || root == null) return;

    // Apply color-scheme to :root (<html>)
    root.style.setProperty(
      'color-scheme',
      brightness == Brightness.dark ? 'dark' : 'light',
    );

    // Apply background to body
    if (backgroundColor != null) {
      body.style.backgroundColor = backgroundColor!.value;
    }

    body.style.margin = '0';
    body.style.padding = '0';
  }
}

/// Represents the brightness mode of the page.
enum Brightness { light, dark }
