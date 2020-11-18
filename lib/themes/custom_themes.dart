import 'package:flutter/material.dart';

class CustomThemes {
  static ThemeData light() {
    return ThemeData.from(
      colorScheme: ColorScheme(
        background: Colors.grey[200],
        brightness: Brightness.light,
        error: Colors.red,
        onBackground: Colors.black45,
        onError: Colors.black,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.black45,
        primary: Colors.pink[700],
        primaryVariant: Colors.pink[900],
        secondary: Colors.teal[300],
        secondaryVariant: Colors.teal[500],
        surface: Colors.white,
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      colorScheme: ColorScheme(
        background: Colors.grey[850],
        brightness: Brightness.dark,
        error: Colors.red,
        onBackground: Colors.white60,
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
    );
  }
}
