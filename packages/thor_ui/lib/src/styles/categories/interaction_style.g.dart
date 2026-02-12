// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interaction_style.dart';

// **************************************************************************
// ThorComponentGenerator
// **************************************************************************

extension InteractionStyleCss on InteractionStyle {
  String toCss() => [
    if (cursor != null) 'cursor: ${cursor!.toStyle()}',
    if (pointerEvents != null) 'pointer-events: ${pointerEvents!.toStyle()}',
    if (userSelect != null) 'user-select: ${userSelect!.toStyle()}',
    if (touchAction != null) 'touch-action: ${touchAction!.toStyle()}',
    if (overscrollBehavior != null)
      'overscroll-behavior: ${overscrollBehavior!.toStyle()}',
    if (scrollBehavior != null) 'scroll-behavior: ${scrollBehavior!.toStyle()}',
    if (appearance != null) 'appearance: ${appearance!.toStyle()}',
    if (caretColor != null) 'caret-color: ${caretColor!.toStyle()}',
    if (outline != null) 'outline: ${outline!}',
    if (outlineOffset != null) 'outline-offset: ${outlineOffset!.toStyle()}',
  ].where((s) => s.isNotEmpty).join('; ');
}
