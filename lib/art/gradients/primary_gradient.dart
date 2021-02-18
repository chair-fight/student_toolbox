import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:student_toolbox/art/gradients/gradient_factory.dart';

class PrimaryGradient implements GradientFactory {
  static Color _primary = const Color(0xff00c450);
  static Color _secondary = const Color(0xff00ca89);

  static Gradient build(BuildContext context) {
    return LinearGradient(
      colors: [
        _primary,
        _secondary,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  Color lerp(BuildContext context, double t) {
    return Color.lerp(
      _primary,
      _secondary,
      t,
    );
  }
}
