import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSwitcher with ChangeNotifier {
  static bool _isDark = true;
  get isDark => _isDark;

  ThemeSwitcher() {
    _loadDarkSetting();
  }

  _loadDarkSetting() {
    SharedPreferences.getInstance().then((sp) {
      var darkSetting = sp.getBool('isDark') ?? false;
      if (isDark != darkSetting) switchTheme();
    });
  }

  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  switchTheme() async {
    _isDark = !_isDark;
    (await SharedPreferences.getInstance()).setBool('isDark', _isDark);
    notifyListeners();
  }
}

final ThemeSwitcher themeSwitcher = ThemeSwitcher();
