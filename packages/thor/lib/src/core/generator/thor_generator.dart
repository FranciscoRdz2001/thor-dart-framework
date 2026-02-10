// ignore_for_file: deprecated_member_use
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

/// Generates extensions for Thor components and style classes.
///
/// Classification logic for `@PropertyAnnotation` fields:
/// - Type has `toStyle()` or `toCss()` → CSS style → `_$styles`
/// - Type is String/int/bool (simple) → HTML attribute → `_$attributes`
///
/// `@StyleAnnotation` on a field → nested style object → `.toCss()` in `_$styles`
/// `@StyleAnnotation` on a class → generates `toCss()` extension
class ThorComponentGenerator extends Generator {
  @override
  Future<String?> generate(LibraryReader library, BuildStep buildStep) async {
    final buffer = StringBuffer();

    for (final classElement in library.classes) {
      if (_hasAnnotation(classElement, 'StyleAnnotation')) {
        final code = _generateStyleClass(classElement);
        if (code != null) buffer.writeln(code);
      }

      if (_hasAnnotation(classElement, 'ComponentAnnotation')) {
        final code = _generateComponent(classElement);
        if (code != null) buffer.writeln(code);
      }
    }

    final result = buffer.toString();
    return result.isEmpty ? null : result;
  }

  // ---- Style class generation ----

  String? _generateStyleClass(ClassElement classElement) {
    final className = classElement.name;
    final entries = <String>[];

    for (final field in _getAllFields(classElement)) {
      if (field.isStatic || field.isSynthetic) continue;

      if (_hasAnnotation(field, 'StyleAnnotation')) {
        final isNullable =
            field.type.nullabilitySuffix == NullabilitySuffix.question;
        if (isNullable) {
          entries.add('if (${field.name} != null) ${field.name}!.toCss()');
        } else {
          entries.add('${field.name}.toCss()');
        }
        continue;
      }

      final cssProperty = _getPropertyAnnotationName(field);
      if (cssProperty == null) continue;

      final valueExpr = _getValueExpression(field);
      if (valueExpr == null) continue;

      final isNullable =
          field.type.nullabilitySuffix == NullabilitySuffix.question;
      if (isNullable) {
        entries.add("if (${field.name} != null) '$cssProperty: $valueExpr'");
      } else {
        entries.add("'$cssProperty: $valueExpr'");
      }
    }

    if (entries.isEmpty) return null;

    return '''
extension ${className}Css on $className {
  String toCss() => [
    ${entries.join(',\n    ')},
  ].where((s) => s.isNotEmpty).join('; ');
}
''';
  }

  // ---- Component generation ----

  String? _generateComponent(ClassElement classElement) {
    final className = classElement.name;
    final tag = _getComponentTag(classElement);
    if (tag == null) return null;

    final buffer = StringBuffer();
    buffer.writeln('extension _\$${className}Generated on $className {');
    buffer.writeln("  String get _\$tag => '$tag';");

    _generateAttributesGetter(buffer, classElement);
    _generateStylesGetter(buffer, classElement);

    buffer.writeln('}');
    return buffer.toString();
  }

  /// Generates `_$attributes` — always includes the runtime type as CSS class,
  /// plus simple types (String, int, bool, etc.) that map to HTML attributes.
  void _generateAttributesGetter(
    StringBuffer buffer,
    ClassElement classElement,
  ) {
    final entries = <String>[];
    String? userClassField;

    for (final field in _getAllFields(classElement)) {
      if (field.isStatic || field.isSynthetic) continue;
      if (_hasAnnotation(field, 'StyleAnnotation')) continue;

      final attrName = _getPropertyAnnotationName(field);
      if (attrName == null) continue;

      // If the type has toStyle()/toCss(), or is explicitly marked as style → skip here
      if (_isStyleType(field.type) || _isPropertyMarkedAsStyle(field)) continue;

      // Track if user has a 'class' field to merge with auto-generated type
      if (attrName == 'class') {
        final isNullable =
            field.type.nullabilitySuffix == NullabilitySuffix.question;
        final isString = field.type.isDartCoreString;
        if (isNullable) {
          userClassField = isString
              ? '${field.name}!'
              : '${field.name}!.toString()';
          entries.add(
            "if (${field.name} != null) 'class': '\$_\$className \${$userClassField}' else 'class': _\$className",
          );
        } else {
          userClassField = isString ? field.name : '${field.name}.toString()';
          entries.add("'class': '\$_\$className \$$userClassField'");
        }
        continue;
      }

      final isNullable =
          field.type.nullabilitySuffix == NullabilitySuffix.question;
      final isString = field.type.isDartCoreString;

      if (isNullable) {
        final valueExpr = isString
            ? '${field.name}!'
            : '${field.name}!.toString()';
        entries.add("if (${field.name} != null) '$attrName': $valueExpr");
      } else {
        final valueExpr = isString ? field.name : '${field.name}.toString()';
        entries.add("'$attrName': $valueExpr");
      }
    }

    // Always add 'class' with runtime type if user didn't define one
    if (userClassField == null) {
      entries.insert(0, "'class': _\$className");
    }

    final customClassName = _getComponentClassName(classElement);
    if (customClassName != null) {
      buffer.writeln("  String get _\$className => '$customClassName';");
    } else {
      buffer.writeln("  String get _\$className => runtimeType.toString();");
    }
    buffer.writeln('  Map<String, String> get _\$attributes => {');
    for (final entry in entries) {
      buffer.writeln('    $entry,');
    }
    buffer.writeln('  };');
  }

  /// Generates `_$styles` — CSS style string from:
  /// 1. `@PropertyAnnotation` fields whose type has `toStyle()`/`toCss()`
  /// 2. `@StyleAnnotation` nested style objects
  void _generateStylesGetter(StringBuffer buffer, ClassElement classElement) {
    final parts = <String>[];

    for (final field in _getAllFields(classElement)) {
      if (field.isStatic || field.isSynthetic) continue;

      // @StyleAnnotation on field → nested style object
      if (_hasAnnotation(field, 'StyleAnnotation')) {
        final isNullable =
            field.type.nullabilitySuffix == NullabilitySuffix.question;
        if (isNullable) {
          parts.add('if (${field.name} != null) ${field.name}!.toCss()');
        } else {
          parts.add('${field.name}.toCss()');
        }
        continue;
      }

      // @PropertyAnnotation on field with style-capable type or marked isStyle
      final cssProperty = _getPropertyAnnotationName(field);
      if (cssProperty == null) continue;
      if (!_isStyleType(field.type) && !_isPropertyMarkedAsStyle(field))
        continue;

      final valueExpr = _getValueExpression(field);
      if (valueExpr == null) continue;

      final isNullable =
          field.type.nullabilitySuffix == NullabilitySuffix.question;
      if (isNullable) {
        parts.add("if (${field.name} != null) '$cssProperty: $valueExpr'");
      } else {
        parts.add("'$cssProperty: $valueExpr'");
      }
    }

    if (parts.isEmpty) return;

    buffer.writeln('  String? get _\$styles {');
    buffer.writeln('    final parts = <String>[');
    for (final part in parts) {
      buffer.writeln('      $part,');
    }
    buffer.writeln('    ].where((s) => s.isNotEmpty);');
    buffer.writeln("    return parts.isEmpty ? null : parts.join('; ');");
    buffer.writeln('  }');
  }

  // ---- Type classification ----

  /// Returns true if the type has `toStyle()`, `toCss()`, uses `ToStyleMixin`,
  /// or is an enum with a `.value` property (CSS value enums).
  bool _isStyleType(DartType type) {
    if (type is! InterfaceType) return false;
    final element = type.element;

    // Enums with .value are treated as CSS style types
    if (element is EnumElement && _hasField(element, 'value')) {
      return true;
    }

    // Enums with toCss() method are also CSS style types
    if (element is EnumElement && _hasMethodInEnum(element, 'toCss')) {
      return true;
    }

    if (element is ClassElement) {
      if (_hasToStyleMixin(element)) return true;
      if (_hasMethod(element, 'toStyle')) return true;
      if (_hasMethod(element, 'toCss')) return true;
    }

    return false;
  }

  /// Returns true if a field's `@PropertyAnnotation` has `isStyle: true`.
  bool _isPropertyMarkedAsStyle(FieldElement field) {
    for (final meta in field.metadata) {
      final element = meta.element;
      if (element is ConstructorElement &&
          element.enclosingElement3.name == 'PropertyAnnotation') {
        final value = meta.computeConstantValue();
        return value?.getField('isStyle')?.toBoolValue() ?? false;
      }
    }
    return false;
  }

  bool _hasToStyleMixin(ClassElement element) {
    for (final mixin in element.mixins) {
      if (mixin.element.name == 'ToStyleMixin') return true;
    }
    ClassElement? current = element;
    while (current?.supertype?.element is ClassElement) {
      current = current!.supertype!.element as ClassElement;
      if (current.name == 'Object') break;
      for (final mixin in current.mixins) {
        if (mixin.element.name == 'ToStyleMixin') return true;
      }
    }
    return false;
  }

  // ---- Annotation helpers ----

  bool _hasAnnotation(Element element, String annotationName) {
    for (final meta in element.metadata) {
      final annotationElement = meta.element;
      if (annotationElement is ConstructorElement &&
          annotationElement.enclosingElement3.name == annotationName) {
        return true;
      }
    }
    return false;
  }

  String? _getComponentTag(ClassElement element) {
    for (final meta in element.metadata) {
      final annotationElement = meta.element;
      if (annotationElement is ConstructorElement &&
          annotationElement.enclosingElement3.name == 'ComponentAnnotation') {
        final value = meta.computeConstantValue();
        return value?.getField('tag')?.toStringValue();
      }
    }
    return null;
  }

  String? _getComponentClassName(ClassElement element) {
    for (final meta in element.metadata) {
      final annotationElement = meta.element;
      if (annotationElement is ConstructorElement &&
          annotationElement.enclosingElement3.name == 'ComponentAnnotation') {
        final value = meta.computeConstantValue();
        final className = value?.getField('className')?.toStringValue();
        if (className == null) return null;
        return className.startsWith('.') ? className.substring(1) : className;
      }
    }
    return null;
  }

  String? _getPropertyAnnotationName(FieldElement field) {
    for (final meta in field.metadata) {
      final element = meta.element;
      if (element is ConstructorElement &&
          element.enclosingElement3.name == 'PropertyAnnotation') {
        final value = meta.computeConstantValue();
        return value?.getField('name')?.toStringValue();
      }
    }
    return null;
  }

  // ---- Value expression helpers ----

  String? _getValueExpression(FieldElement field) {
    final name = field.name;
    final type = field.type;
    final isNullable = type.nullabilitySuffix == NullabilitySuffix.question;
    final bang = isNullable ? '!' : '';

    if (type.isDartCoreString) return '\${$name$bang}';
    if (type.isDartCoreInt) return '\${$name$bang}';
    if (type.isDartCoreDouble) return '\${$name$bang}';

    if (type is InterfaceType) {
      final element = type.element;

      if (element is EnumElement && _hasMethodInEnum(element, 'toStyle')) {
        return '\${$name$bang.toStyle()}';
      }

      if (element is ClassElement) {
        if (_hasToStyleMixin(element) && _hasMethod(element, 'toStyle')) {
          return '\${$name$bang.toStyle()}';
        }
        if (_hasMethod(element, 'toCss')) return '\${$name$bang.toCss()}';
        if (_hasField(element, 'value')) return '\${$name$bang.value}';
      }
    }

    return null;
  }

  bool _hasField(InterfaceElement element, String fieldName) =>
      element.fields.any((f) => f.name == fieldName && !f.isEnumConstant);

  bool _hasMethod(ClassElement element, String methodName) =>
      element.methods.any((m) => m.name == methodName);

  /// Check if an enum has a specific method
  bool _hasMethodInEnum(EnumElement element, String methodName) =>
      element.methods.any((m) => m.name == methodName);

  // ---- Field traversal ----

  Iterable<FieldElement> _getAllFields(ClassElement element) {
    final fields = <FieldElement>[];
    fields.addAll(element.fields);

    ClassElement? current = element;
    while (current?.supertype?.element is ClassElement) {
      current = current!.supertype!.element as ClassElement;
      if (current.name == 'Object') break;
      fields.addAll(current.fields);
    }

    return fields;
  }
}
