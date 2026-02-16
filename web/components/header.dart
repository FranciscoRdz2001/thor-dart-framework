import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';
import '../styles/app_styles.dart';

class StoreHeader extends StatelessComponent {
  static final _headerRow = StyleClass('header-row', css([
    SpacingStyle(gap: 20.px),
  ]));

  static final _navRow = StyleClass('nav-row', css([
    SpacingStyle(gap: 24.px),
  ]));

  static final _logoRow = StyleClass('logo-row', css([
    SpacingStyle(gap: 12.px),
  ]));

  @override
  List<StyleClass> get componentStyles => [_headerRow, _navRow, _logoRow];

  @override
  Component build(BuildContext context) {
    return Row(
      styleClasses: [_headerRow],
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            styleClasses: [_logoRow],
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Box(styleClasses: [AppStyles.accentBar]),
              Text('My Store', styleClasses: [AppStyles.logoText]),
            ],
          ),
        ),
        Row(
          styleClasses: [_navRow],
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Home', styleClasses: [AppStyles.navLink]),
            Text('Products', styleClasses: [AppStyles.navLink]),
            Text('About', styleClasses: [AppStyles.navLink]),
            Text('Contact', styleClasses: [AppStyles.navLink]),
          ],
        ),
      ],
    );
  }
}
