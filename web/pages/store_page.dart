import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';
import '../components/header.dart';
import '../components/store_title.dart';
import '../components/store_collections.dart';
import '../components/footer.dart';
import '../styles/app_styles.dart';

class StorePage extends StatelessComponent {
  final homeCardClass = StyleClass(
    'home-cards',
    css([
      SizeStyle(width: 100.px, height: 100.px),
      DecorationStyle(borderRadius: 8.px),
    ]),
  );

  @override
  List<StyleClass> get componentStyles => [homeCardClass];
  @override
  Component build(BuildContext context) {
    return Column(
      gap: 24.px,
      children: [
        Row(
          children: [
            Box(
              styleClasses: [homeCardClass],
              decoration: DecorationStyle(backgroundColor: Color.red),
            ),
            Box(
              styleClasses: [homeCardClass],
              decoration: DecorationStyle(backgroundColor: Color.green),
            ),
            Box(
              styleClasses: [homeCardClass],
              decoration: DecorationStyle(backgroundColor: Color.blue),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Box(
                size: SizeStyle(height: 100.px),
                decoration: DecorationStyle(backgroundColor: Color.red),
              ),
            ),
            Box(
              styleClasses: [homeCardClass],
              decoration: DecorationStyle(backgroundColor: Color.green),
            ),
            Box(
              styleClasses: [homeCardClass],
              decoration: DecorationStyle(backgroundColor: Color.blue),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Testing without Expanded asdasdasd',
              typoGraphyStyle: TypographyStyle(fontSize: 16.px),
            ),
            Box(
              styleClasses: [homeCardClass],
              decoration: DecorationStyle(backgroundColor: Color.green),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'waaaa',
                  typoGraphyStyle: TypographyStyle(fontSize: 16.px),
                ),
                Box(
                  styleClasses: [homeCardClass],
                  decoration: DecorationStyle(backgroundColor: Color.green),
                ),
                Box(
                  styleClasses: [homeCardClass],
                  decoration: DecorationStyle(backgroundColor: Color.blue),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Expanded(child: Text('Hola')),
            Text('Hola2'),
          ],
        ),
        Row(
          children: [
            Text('Without Expanded'),
            Box(
              styleClasses: [homeCardClass],
              decoration: DecorationStyle(backgroundColor: Color.green),
            ),
            Text('Hola2'),
          ],
        ),
        Row(
          gap: 8.px,
          children: [
            Text('With Expanded'),
            Expanded(
              child: Box(
                styleClasses: [homeCardClass],
                decoration: DecorationStyle(backgroundColor: Color.red),
              ),
            ),
            Expanded(
              flex: 2,
              child: Box(
                styleClasses: [homeCardClass],
                decoration: DecorationStyle(backgroundColor: Color.green),
              ),
            ),
            Text('Hola2'),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text('Column 1'),
                  Box(
                    styleClasses: [homeCardClass],
                    decoration: DecorationStyle(backgroundColor: Color.red),
                  ),
                ],
              ),
            ),

            Column(
              children: [
                Text('Column 2'),
                Box(
                  styleClasses: [homeCardClass],
                  decoration: DecorationStyle(backgroundColor: Color.green),
                ),
              ],
            ),
            Column(
              children: [
                Text('Column 3'),
                Box(
                  styleClasses: [homeCardClass],
                  decoration: DecorationStyle(backgroundColor: Color.blue),
                ),
              ],
            ),
          ],
        ),
        // Box(
        //   child: Box(
        //     child: Column(
        //       children: [
        //         StoreHeader(),
        //         Box(styleClasses: [AppStyles.divider]),
        //         StoreTitle(),
        //         Box(styleClasses: [AppStyles.spacerLg]),
        //         StoreCollections(),
        //         Box(styleClasses: [AppStyles.spacerLg]),
        //       ],
        //     ),
        //   ),
        // ),
        // StoreFooter(),
      ],
    );
  }
}
