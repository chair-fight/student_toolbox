import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/models/user_model.dart';
import 'package:student_toolbox/widgets/app_bars/simple_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  final User metaUser;
  final UserModel user;

  const ProfileScreen({Key key, this.metaUser, this.user}) : super(key: key);

  @override
  _ProfileScreenState createState() {
    return _ProfileScreenState(
      metaUser: metaUser,
      user: user,
    );
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  User metaUser;
  UserModel user;

  _ProfileScreenState({this.user, this.metaUser});

  Future<void> _pullUser() async {
    print(metaUser);
    // FIXME - Replace this line
    //user = await Database.getDBUser(metaUser);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: (user != null) ? Future.value() : _pullUser(),
      builder: (BuildContext context, AsyncSnapshot<void> buffer) {
        return Scaffold(
          appBar: SimpleAppBar(
            title: Text("Profile"),
          ),
        );
      },
    );
  }
}
