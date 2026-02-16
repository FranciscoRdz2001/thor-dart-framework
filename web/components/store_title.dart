import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';
import '../styles/app_styles.dart';

class StoreTitle extends StatelessComponent {
  /// Component-scoped styles.
  static final _heroGap = StyleClass('hero-gap', css([
    SpacingStyle(gap: 16.px),
  ]));

  static final _heroRow = StyleClass('hero-row', css([
    SpacingStyle(gap: 32.px),
  ]));

  @override
  List<StyleClass> get componentStyles => [_heroGap, _heroRow];

  @override
  Component build(BuildContext context) {
    return Row(
      styleClasses: [_heroRow],
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            styleClasses: [_heroGap],
            children: [
              Text(
                'Discover Our Latest Collection',
                styleClasses: [AppStyles.heroTitle],
              ),
              Text(
                'Handpicked products with premium quality. '
                'Explore new arrivals and exclusive deals curated just for you.',
                styleClasses: [AppStyles.heroSubtitle],
              ),
              Box(styleClasses: [AppStyles.spacerSm]),
              Row(
                gap: 12.px,
                children: [
                  Box(
                    styleClasses: [AppStyles.heroCta],
                    child: Text('Shop Now'),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              Box(
                styleClasses: [AppStyles.offerBanner],
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  gap: 8.px,
                  children: [
                    Text('Special Offer!', styleClasses: [AppStyles.offerTitle]),
                    Text('Up to 50% off this weekend', styleClasses: [AppStyles.offerSubtitle]),
                  ],
                ),
              ),
              Positioned(
                position: Position.absolute,
                right: 16.px,
                bottom: 16.px,
                child: Box(
                  styleClasses: [AppStyles.badge],
                  alignment: Alignment.center,
                  child: Text('NEW', styleClasses: [AppStyles.badgeText]),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
