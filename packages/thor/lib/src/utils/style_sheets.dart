import 'package:thor/src/core/core.dart';

abstract class StyleSheets with ToStyleMixin {
  final Map<String, String> styles;

  const StyleSheets(this.styles);

  @override
  String toStyle() {
    return styles.entries
        .map((e) => '${e.key} { ${e.value}; }')
        .join('\n');
  }
}
