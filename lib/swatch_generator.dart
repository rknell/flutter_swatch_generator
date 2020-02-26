library swatch_generator;

import 'package:flutter/material.dart';

/// A Calculator.
class SwatchGenerator {
  static MaterialColor fromColor(Color color) {
    return MaterialColor(color.value, {
      50: _lighten(color, 45),
      100: _lighten(color, 40),
      200: _lighten(color, 30),
      300: _lighten(color, 20),
      400: _lighten(color, 10),
      500: color,
      600: _darken(color, 10),
      700: _darken(color, 20),
      800: _darken(color, 30),
      900: _darken(color, 40),
    });
  }

  static Color _darken(Color color, double percent) {
    return Color.fromARGB(
      color.alpha,
      _shiftComponent(color.red, percent),
      _shiftComponent(color.green, percent),
      _shiftComponent(color.blue, percent),
    );
  }

  static Color _lighten(Color color, double percent) {
    return _darken(color, percent + 100);
  }

  static Map<String, double> brightnessDiff(Color color1, Color color2) {
    return {
      "red": color1.red / color2.red,
      "green": color1.green / color2.green,
      "blue": color1.blue / color2.blue,
    };
  }

  static int _shiftComponent(int value, double percent) {
    final percentDecimal = percent / 100;
    final result = (value.toDouble() * percentDecimal).round();
    if (result < 0) return 0;
    if (result > 255) return 255;
    return result;
  }
}
