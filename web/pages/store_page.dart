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
      child: Box(
        alignment: Alignment.center,
        size: SizeStyle(maxWidth: 1000.px),
        child: Box(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Box(
                    size: SizeStyle(width: 20.px, height: 40.px),
                    decoration: DecorationStyle(backgroundColor: Color.blue),
                  ),
                  Expanded(child: StoreHeader()),
                ],
              ),
              Box(size: SizeStyle(height: 40.px)),
              StoreTitle(),
              Box(size: SizeStyle(height: 40.px)),
              StoreCollections(),
              Box(size: SizeStyle(height: 100.px)),
            ],
          ),
        ),
      ),
    );
  }
}
