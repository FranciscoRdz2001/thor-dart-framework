import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';

class StoreHeader extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.px),
      child: Row(
        gap: 20.px,
        children: [
          Expanded(
            child: Text(
              'My Store',
              style: TextStyle(fontSize: 24.px, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            gap: 20.px,
            mainAxisSize: MainAxisSize.min,
            children: [Text('Home'), Text('Products'), Text('Contact')],
          ),
        ],
      ),
    );
  }
}
