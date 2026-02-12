import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';
part 'interaction_style.g.dart';

@StyleAnnotation()
class InteractionStyle extends ThorStyle {
  const InteractionStyle({
    this.cursor,
    this.pointerEvents,
    this.userSelect,
    this.touchAction,
    this.overscrollBehavior,
    this.scrollBehavior,
    this.appearance,
    this.caretColor,
    this.outline,
    this.outlineOffset,
    this.tabIndex,
    this.draggable,
  });

  /// Mouse cursor when hovering the element.
  @StylePropertyAnnotation('cursor')
  final Cursor? cursor;

  /// Controls whether an element can be the target of pointer events.
  @StylePropertyAnnotation('pointer-events')
  final PointerEvents? pointerEvents;

  /// Controls text selection (useful for buttons / labels).
  @StylePropertyAnnotation('user-select')
  final UserSelect? userSelect;

  /// How touch input is handled (important for mobile web).
  @StylePropertyAnnotation('touch-action')
  final TouchAction? touchAction;

  /// Controls chaining and overscroll/bounce behavior.
  @StylePropertyAnnotation('overscroll-behavior')
  final OverscrollBehavior? overscrollBehavior;

  /// Scroll behavior when programmatically scrolling or anchor links.
  @StylePropertyAnnotation('scroll-behavior')
  final ScrollBehavior? scrollBehavior;

  /// Native control styling (useful for inputs/buttons to normalize).
  @StylePropertyAnnotation('appearance')
  final Appearance? appearance;

  /// Color of the caret in inputs / editable text.
  @StylePropertyAnnotation('caret-color')
  final Color? caretColor;

  /// Focus ring outline (if you rely on CSS for focus visuals).
  @StylePropertyAnnotation('outline')
  final String? outline;

  /// Offset of outline.
  @StylePropertyAnnotation('outline-offset')
  final Unit? outlineOffset;

  /// Engine-level: adds tabindex attribute to make element focusable.
  /// Not a CSS property (so no annotation). Your renderer should map this to the HTML attribute.
  final int? tabIndex;

  /// Engine-level: maps to HTML attribute draggable="true/false".
  /// Not a CSS property (so no annotation).
  final bool? draggable;
}
