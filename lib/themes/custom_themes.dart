import 'package:flutter/material.dart';

class CustomThemes {
  static ThemeData classic() {
    return ThemeData.from(
      colorScheme: ColorScheme(
        background: Color(0xff282828),
        brightness: Brightness.dark,
        error: Colors.red,
        onBackground: Colors.white,
        onError: Colors.black,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Colors.white,
        primary: Colors.pink[700],
        primaryVariant: Colors.pink[700],
        secondary: Colors.cyan[300],
        secondaryVariant: Colors.cyan[300],
        surface: Color(0xff1b1b1b),
      ),
    ).copyWith(
      splashColor: Colors.cyan[300],
      primaryColor: Colors.grey[900],
      buttonColor: Colors.pink[700],
    );
  }
}
