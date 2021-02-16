import 'package:flutter/material.dart';

/// Base gradient factory interface.
///
/// Provides flutter gradients and colors based on implementation.
abstract class GradientFactory {
  /// Builds the gradient object.
  Gradient build(BuildContext context);

  /// Linearly interpolates a color from the gradient at a given point t.
  Color lerp(BuildContext context, double t);
}
