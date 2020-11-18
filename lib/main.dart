import 'package:flutter/material.dart';
import 'package:student_toolbox/screens/wrapper_screen.dart';
import 'package:student_toolbox/themes/themes.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomThemes.dark(),
      home: WrapperScreen(),
    );
  }
}
