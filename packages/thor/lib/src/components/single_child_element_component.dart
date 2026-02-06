import 'package:thor/src/components/web_component.dart';

abstract class SingleChildElementComponent extends WebComponent {
  const SingleChildElementComponent({required this.child});

  final WebComponent? child;

  List<WebComponent> get children => child == null ? const [] : [child!];
}
