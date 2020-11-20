import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:student_toolbox/screens/wrapper_screen.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/themes/custom_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomThemes.dark(),
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Scaffold(
              body: Center(
                child:
                    Text("Something went wrong"), // TODO - Make an error screen
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamProvider<User>.value(
                value: AuthService().user, child: WrapperScreen());
          }
          return const Scaffold(
            body: Center(
              child: Text("Loading..."), // TODO - make a loading screen
            ),
          );
        },
      ),
    );
  }
}
