import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';
import '../components/header.dart';
import '../components/store_title.dart';
import '../components/store_collections.dart';

class StorePage extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200.px),
        child: Column(
          children: [
            StoreHeader(),
            Box(height: 40.px),
            StoreTitle(),
            Box(height: 40.px),
            StoreCollections(),
            Box(height: 100.px),
          ],
        ),
      ),
    );
  }
}
