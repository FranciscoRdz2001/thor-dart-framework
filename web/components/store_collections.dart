import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';

class StoreCollections extends StatelessComponent {
  Component _getCollection(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Text('Collection 1')),
            Box(width: 20.px),
            Text('Collection 2'),
          ],
        ),
      ],
    );
  }

  @override
  Component build(BuildContext context) {
    return Column(
      gap: 100.px,
      children: List.generate(3, (_) => _getCollection(context)),
    );
  }
}
