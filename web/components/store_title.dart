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
          child: Box(
            height: 500.px,
            decoration: BoxDecoration(
              color: Color.blue,
              borderRadius: BorderRadius.all(12.px),
            ),
          ),
        ),
      ],
    );
  }
}
