import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:student_toolbox/art/gradients/gradient.dart';

class PrimaryGradient implements GradientFactory {
  Gradient build(BuildContext context) {
    return LinearGradient(
      colors: [
        Color(0xff00d460),
        Color(0xff00daa9),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  Color lerp(BuildContext context, double t) {
    return Color.lerp(
      Color(0xff00d460),
      Color(0xff00daa9),
      t,
    );
  }
}
