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
                style: TextStyle(fontSize: 32.px, fontWeight: FontWeight.bold),
              ),
              Text(
                'Find the best products here!',
                style: TextStyle(fontSize: 18.px, color: Color.grey),
              ),
            ],
          ),
        ),

        Expanded(
          child: Stack(
            children: [
              Box(
                height: 500.px,
                decoration: BoxDecoration(
                  color: Color.blue,
                  borderRadius: BorderRadius.all(12.px),
                ),
              ),

              Column(
                children: [
                  Box(
                    height: 200.px,
                    decoration: BoxDecoration(
                      color: Color.green,
                      borderRadius: BorderRadius.all(12.px),
                    ),
                    child: Text(
                      'Special Offer!',
                      style: TextStyle(
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
                  width: 100.px,
                  height: 100.px,
                  decoration: BoxDecoration(
                    color: Color.darkGrey,
                    borderRadius: BorderRadius.all(12.px),
                  ),
                  child: Text(
                    'New!',
                    style: TextStyle(
                      fontSize: 16.px,
                      color: Color.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
