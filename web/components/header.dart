import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';

class StoreHeader extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return Row(
      gap: 20.px,
      children: [
        Expanded(
          child: Text(
            'My Store',
            typoGraphyStyle: TypographyStyle(
              fontSize: 24.px,
              fontWeight: FontWeight.bold,
            ),
            interactionStyle: InteractionStyle(cursor: Cursor.pointer),
          ),
        ),
        Row(
          gap: 20.px,
          mainAxisSize: MainAxisSize.min,
          children: [Text('Home'), Text('Products'), Text('Contact')],
        ),
      ],
    );
  }
}
