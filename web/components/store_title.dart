import 'package:thor/thor.dart';
import 'package:thor_ui/thor_ui.dart';

class StoreTitle extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return Row(
      gap: 20.px,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                'Welcome to My Store',
                typoGraphyStyle: TypographyStyle(
                  fontSize: 32.px,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Find the best products here!',
                typoGraphyStyle: TypographyStyle(
                  fontSize: 18.px,
                  color: Color.grey,
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: Stack(
            children: [
              Box(
                size: SizeStyle(width: 500.px, height: 200.px),
                decoration: DecorationStyle(backgroundColor: Color.blue),
              ),

              Column(
                children: [
                  Box(
                    size: SizeStyle(height: 200.px),
                    decoration: DecorationStyle(backgroundColor: Color.red),
                    child: Text(
                      'Special Offer!',
                      typoGraphyStyle: TypographyStyle(
                        fontSize: 24.px,
                        color: Color.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                position: Position.absolute,
                left: 20.px,

                child: Box(
                  size: SizeStyle(width: 100.px, height: 100.px),
                  decoration: DecorationStyle(backgroundColor: Color.darkGrey),
                  child: Text(
                    'New!',
                    typoGraphyStyle: TypographyStyle(
                      fontSize: 16.px,
                      color: Color.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text('Centered Text'),
              ),
              Text(
                'Align!',
                typoGraphyStyle: TypographyStyle(
                  fontSize: 16.px,
                  color: Color.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
