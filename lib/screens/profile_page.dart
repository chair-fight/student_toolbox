import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/models/user_model.dart';

class ProfilePage extends StatefulWidget {
  final User metaUser;
  final UserModel user;

  const ProfilePage({Key key, this.metaUser, this.user}) : super(key: key);

  @override
  _ProfilePageState createState() {
    return _ProfilePageState(
      metaUser: metaUser,
      user: user,
    );
  }
}

class _ProfilePageState extends State<ProfilePage> {
  User metaUser;
  UserModel user;

  _ProfilePageState({this.user, this.metaUser});

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
            appBar: AppBar(
              title: Text("Profile"),
              leading: FlatButton(
                child: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          );
        });
  }
}
