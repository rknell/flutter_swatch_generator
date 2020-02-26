import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:swatch_generator/swatch_generator.dart';

void main() {
  test("generates a material colour from a base", () {
    final result = SwatchGenerator.fromColor(Color(0xFF2196F3));
    print(result);
    print(result.shade900);
    print(result.shade500);
    print(result.shade400);
    print(result.shade300);
    print(result.shade200);
    print(result.shade50);
  });

  test("generates brightness difference", () {
    print(SwatchGenerator.brightnessDiff(Color(0xFFE3F2FD), Color(0xFF2196F3)));
  });
}
