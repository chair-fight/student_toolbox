import 'package:flutter/material.dart';

/// Base gradient factory interface.
///
/// Provides flutter gradients and colors based on implementation.
abstract class GradientFactory {
  /// Builds the gradient object.
  static Gradient build(BuildContext context) => null;

  /// Linearly interpolates a color from the gradient at a given point t.
  static Color lerp(BuildContext context, double t) => null;
}
