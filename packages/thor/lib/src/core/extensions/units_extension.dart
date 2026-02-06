import 'package:thor/src/core/models/unit.dart';

extension UnitExtension on num {
  Unit get px => Unit('px', this);
  Unit get em => Unit('em', this);
  Unit get rem => Unit('rem', this);
  Unit get percent => Unit('%', this);
}
