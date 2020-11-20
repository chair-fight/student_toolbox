import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:student_toolbox/screens/wrapper_screen.dart';
import 'package:student_toolbox/themes/custom_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
