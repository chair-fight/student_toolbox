import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_toolbox/screens/sign_in_screen.dart';
import 'package:student_toolbox/services/firebase_data.dart';

import 'home_screen.dart';

class WrapperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User>(context, listen: true);
    if (_user == null || !_user.emailVerified)
      return SignInScreen();
    else {
      FirebaseData.init(_user.uid);
      return HomeScreen();
    }
  }
}
