import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:student_toolbox/art/gradients/gradient.dart';

class NaturalGradientFactory implements GradientFactory {
  Gradient build(BuildContext context) {
    return LinearGradient(
      colors: [
        Colors.deepOrange,
        Colors.lightGreenAccent,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  Color lerp(BuildContext context, double t) {
    return Color.lerp(Colors.deepOrange, Colors.lightGreenAccent, t);
  }
}
