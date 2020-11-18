import 'package:flutter/material.dart';
import 'package:student_toolbox/screens/wrapper_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: WrapperScreen(),
    );
  }
}
