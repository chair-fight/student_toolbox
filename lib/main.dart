import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:student_toolbox/screens/loading_screen.dart';
import 'package:student_toolbox/screens/wrapper_screen.dart';
import 'package:student_toolbox/services/auth.dart';
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
          return LoadingScreen();
        },
      ),
    );
  }
}
