import 'package:flutter/material.dart';

class CustomThemes {
  static ThemeData classic() {
    return ThemeData(
      colorScheme: ColorScheme(
        background: Colors.grey[850],
        brightness: Brightness.dark,
        error: Colors.red,
        onBackground: Colors.white,
        onError: Colors.black,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        primary: Colors.pink[700],
        primaryVariant: Colors.pink[900],
        secondary: Colors.teal[300],
        secondaryVariant: Colors.teal[500],
        surface: Colors.grey[900],
      ),
      splashColor: Colors.teal[300],
    );
  }
}
