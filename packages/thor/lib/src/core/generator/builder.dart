import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'package:thor/src/core/generator/thor_generator.dart';

/// Entry point for `build_runner`.
/// Declared in `build.yaml` as the builder factory.
Builder thorComponentBuilder(BuilderOptions options) => SharedPartBuilder(
      [ThorComponentGenerator()],
      'thor_component',
    );
