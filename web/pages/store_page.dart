import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';
import '../components/header.dart';
import '../components/store_title.dart';
import '../components/store_collections.dart';

class StorePage extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return Box(
      alignment: Alignment.center,
      size: SizeStyle(maxWidth: 1000.px),
      child: Box(
        child: Column(
          children: [
            StoreHeader(),
            Box(size: SizeStyle(height: 40.px)),
            StoreTitle(),
            Box(size: SizeStyle(height: 40.px)),
            StoreCollections(),
            Box(size: SizeStyle(height: 100.px)),
          ],
        ),
      ),
    );
  }
}
