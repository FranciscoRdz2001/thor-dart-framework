import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';
import '../styles/app_styles.dart';

class StoreFooter extends StatelessComponent {
  static final _footerColumns = StyleClass('footer-cols', css([
    SpacingStyle(gap: 40.px),
  ]));

  static final _footerCol = StyleClass('footer-col', css([
    SpacingStyle(gap: 8.px),
  ]));

  @override
  List<StyleClass> get componentStyles => [_footerColumns, _footerCol];

  @override
  Component build(BuildContext context) {
    return Box(
      styleClasses: [AppStyles.footerBg],
      child: Row(
        styleClasses: [_footerColumns],
        children: [
          Expanded(
            child: Column(
              styleClasses: [_footerCol],
              children: [
                Text('My Store', styleClasses: [AppStyles.footerHeading]),
                Text(
                  'Premium products, curated for you.',
                  styleClasses: [AppStyles.footerText],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              styleClasses: [_footerCol],
              children: [
                Text('Shop', styleClasses: [AppStyles.footerHeading]),
                Text('New Arrivals', styleClasses: [AppStyles.footerLink]),
                Text('Best Sellers', styleClasses: [AppStyles.footerLink]),
                Text('Sale', styleClasses: [AppStyles.footerLink]),
              ],
            ),
          ),
          Expanded(
            child: Column(
              styleClasses: [_footerCol],
              children: [
                Text('Support', styleClasses: [AppStyles.footerHeading]),
                Text('Help Center', styleClasses: [AppStyles.footerLink]),
                Text('Returns', styleClasses: [AppStyles.footerLink]),
                Text('Contact Us', styleClasses: [AppStyles.footerLink]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
