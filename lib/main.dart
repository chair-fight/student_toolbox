import 'package:flutter/material.dart';
import 'package:student_toolbox/screens/wrapper_screen.dart';
import 'package:student_toolbox/services/theme_switcher.dart';
import 'package:student_toolbox/themes/custom_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    themeSwitcher.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomThemes.light(),
      darkTheme: CustomThemes.dark(),
      themeMode: themeSwitcher.currentTheme(),
      home: WrapperScreen(),
    );
  }
}
