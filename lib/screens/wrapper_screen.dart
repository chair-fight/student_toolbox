import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/screens/sign_in_screen.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/widgets/loading_widget.dart';

import 'home_screen.dart';

class WrapperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Scaffold(body: Center(child: Text("Something went wrong"))); // TODO - Make an error screen
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder<User>(
            stream: AuthService().user,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null && snapshot.data.emailVerified) {
                return HomeScreen();
              }
              return SignInScreen();
            },
          );
        }
        return LoadingWidget();
      },
    );
  }
}
