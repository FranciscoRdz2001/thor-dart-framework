import 'package:thor/thor.dart';
part 'stack.g.dart';

@ComponentAnnotation('div', className: '.stack')
class Stack extends MultiChildElementComponent {
  Stack({super.key, List<Component>? children}) : _children = children ?? [];

  final List<Component> _children;

  @override
  List<Component> get children => _children;

  @override
  String get tag => _$tag;

  @override
  Component build(BuildContext context) {
    return ElementNode(
      tag: _$tag,
      key: key,
      children: children,
      attributes: _$attributes,
    );
  }
}
