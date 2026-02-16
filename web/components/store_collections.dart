import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';
import '../styles/app_styles.dart';

class StoreCollections extends StatelessComponent {
  static final _sectionGap = StyleClass('section-gap', css([
    SpacingStyle(gap: 32.px),
  ]));

  static final _headerGap = StyleClass('section-header-gap', css([
    SpacingStyle(gap: 4.px),
  ]));

  static final _gridGap = StyleClass('grid-gap', css([
    SpacingStyle(gap: 20.px),
  ]));

  static final _cardGap = StyleClass('card-gap', css([
    SpacingStyle(gap: 12.px),
  ]));

  @override
  List<StyleClass> get componentStyles => [
    _sectionGap, _headerGap, _gridGap, _cardGap,
  ];

  @override
  Component build(BuildContext context) {
    return Column(
      styleClasses: [_sectionGap],
      children: [
        Column(
          styleClasses: [_headerGap],
          children: [
            Text('Featured Products', styleClasses: [AppStyles.sectionTitle]),
            Text('Our top picks for you', styleClasses: [AppStyles.sectionSubtitle]),
          ],
        ),
        Row(
          styleClasses: [_gridGap],
          children: [
            Expanded(child: _ProductCard(
              name: 'Wireless Headphones',
              price: '\$89.99',
              description: 'Premium sound, 30h battery',
            )),
            Expanded(child: _ProductCard(
              name: 'Smart Watch',
              price: '\$199.99',
              description: 'Health tracking, GPS',
            )),
            Expanded(child: _ProductCard(
              name: 'Leather Backpack',
              price: '\$149.99',
              description: 'Handcrafted, water-resistant',
            )),
          ],
        ),
      ],
    );
  }
}

class _ProductCard extends StatelessComponent {
  final String name;
  final String price;
  final String description;

  const _ProductCard({
    required this.name,
    required this.price,
    required this.description,
  });

  @override
  Component build(BuildContext context) {
    return Box(
      styleClasses: [AppStyles.card],
      child: Column(
        styleClasses: [StoreCollections._cardGap],
        children: [
          Box(styleClasses: [AppStyles.cardImage]),
          Text(name, styleClasses: [AppStyles.cardTitle]),
          Text(description, styleClasses: [AppStyles.cardDescription]),
          Text(price, styleClasses: [AppStyles.cardPrice]),
        ],
      ),
    );
  }
}
