import 'package:flutter/material.dart';

class CustomThemes {
  static final Color _trueLight = Color(0xffffffff);
  static final Color _trueDark = Color(0xff000000);

  static final Color _light1 = Color(0xfff2f2f2);
  static final Color _light2 = Color(0xffe3e3e3);
  static final Color _light3 = Color(0xffd4d4d4);
  static final Color _onLight1 = Color(0xff333333);
  static final Color _onLight2 = Color(0x50333333);

  static final Color _dark1 = Color(0xff242424);
  static final Color _dark2 = Color(0xff333333);
  static final Color _dark3 = Color(0xff424242);
  static final Color _onDark1 = Color(0xffffffff);
  static final Color _onDark2 = Color(0x50ffffff);

  static final Color _primary = Color(0xff00C76D);
  static final Color _secondary = Color(0xff009eff);
  static final Color _error = Color(0xffcf1f1b);

  static ThemeData light() {
    return ThemeData.from(
      colorScheme: ColorScheme(
        background: _light2,
        brightness: Brightness.light,
        error: _error,
        onBackground: _onLight1,
        onError: _onLight1,
        onPrimary: _onDark1,
        onSecondary: _onLight1,
        onSurface: _onLight1,
        primary: _primary,
        primaryVariant: _primary,
        secondary: _secondary,
        secondaryVariant: _secondary,
        surface: _light1,
      ),
    ).copyWith(
      splashColor: _primary.withOpacity(.3),
      primaryColor: Colors.grey[900],
      buttonColor: _primary,
      dividerColor: _light3,
      toggleableActiveColor: _primary,
      primaryTextTheme: _textThemeFromColor(_onDark1),
      primaryIconTheme: _iconThemeFromColor(_onDark1),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(0, 36)),
          backgroundColor: MaterialStateProperty.all<Color>(_primary),
          overlayColor: MaterialStateProperty.all<Color>(_primary.withOpacity(.3)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(0, 36)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
          overlayColor: MaterialStateProperty.all<Color>(_primary.withOpacity(.3)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(0, 36)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
          overlayColor: MaterialStateProperty.all<Color>(_primary.withOpacity(.3)),
        ),
      ),
      appBarTheme: AppBarTheme(
        color: _primary,
        brightness: Brightness.light,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: _light1,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: _primary,
        unselectedItemColor: _onLight1,
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData.from(
      colorScheme: ColorScheme(
        background: _dark2,
        brightness: Brightness.dark,
        error: _error,
        onBackground: _onDark1,
        onError: _onDark1,
        onPrimary: _onLight1,
        onSecondary: _onDark1,
        onSurface: _onDark1,
        primary: _primary,
        primaryVariant: _primary,
        secondary: _secondary,
        secondaryVariant: _secondary,
        surface: _dark1,
      ),
    ).copyWith(
      splashColor: _onDark2,
      primaryColor: Colors.grey[900],
      buttonColor: _primary,
      dividerColor: _dark3,
      toggleableActiveColor: _primary,
      primaryTextTheme: _textThemeFromColor(_onDark1),
      primaryIconTheme: _iconThemeFromColor(_onDark1),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(0, 36)),
          backgroundColor: MaterialStateProperty.all<Color>(_primary),
          overlayColor: MaterialStateProperty.all<Color>(_onDark2),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(0, 36)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
          overlayColor: MaterialStateProperty.all<Color>(_onDark2),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(0, 36)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
          overlayColor: MaterialStateProperty.all<Color>(_onDark2),
        ),
      ),
      appBarTheme: AppBarTheme(
        color: _dark3,
        brightness: Brightness.dark,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: _dark3,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: _primary,
        unselectedItemColor: _onDark1,
      ),
    );
  }

  static TextTheme _textThemeFromColor(Color color) {
    return TextTheme(
      headline1: TextStyle(color: color),
      headline2: TextStyle(color: color),
      headline3: TextStyle(color: color),
      headline4: TextStyle(color: color),
      headline5: TextStyle(color: color),
      headline6: TextStyle(color: color),
      subtitle1: TextStyle(color: color),
      subtitle2: TextStyle(color: color),
      bodyText1: TextStyle(color: color),
      bodyText2: TextStyle(color: color),
      caption: TextStyle(color: color),
    );
  }

  static IconThemeData _iconThemeFromColor(Color color) {
    return IconThemeData(color: color);
  }
}
