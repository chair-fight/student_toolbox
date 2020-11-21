import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_toolbox/models/user_model.dart';
import 'package:student_toolbox/screens/loading_screen.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/services/database.dart';
import 'package:student_toolbox/widgets/button_primary.dart';
import 'package:student_toolbox/widgets/profile_mini.dart';
import 'package:student_toolbox/widgets/profile_preview.dart';
import 'package:student_toolbox/widgets/screen_app_bar.dart';
import 'package:student_toolbox/widgets/surface.dart';

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
    user = await Database.getDBUser(metaUser);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: (user != null) ? Future.value() : _pullUser(),
        builder: (BuildContext context, AsyncSnapshot<void> buffer) {
          return Scaffold(
            appBar: ScreenAppBar(
              title: "Profile",
              subScreen: true,
            ).get(context),
            body: (user == null)
                ? LoadingScreen()
                : ListView(
                    children: [
                      ProfilePreview(
                        user: user,
                        navigateOnPress: false,
                      ),
                      if (metaUser == null || metaUser.uid != AuthService().currentUser.uid) Surface(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ButtonPrimary(
                              label: "Add Friend",
                              leading: Icons.person_add,
                              width: 160,
                              onPressed: () {},
                            ),
                            ButtonPrimary(
                              label: "Invite to Group",
                              leading: Icons.group_add,
                              width: 160,
                              onPressed: () {},
                            ),
                          ],
                        )
                      ]),
                      Surface(
                        title: "Status",
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              alignment: AlignmentDirectional.topStart,
                              child: Text("Hello World")),
                        ],
                      ),
                      Surface(
                        title: "Info",
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        children: [
                          TextFormField(
                            initialValue: user.university,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: "University",
                              isDense: true,
                            ),
                          ),
                          TextFormField(
                            initialValue: user.email,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: "Email",
                              isDense: true,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
          );
        });
  }
}
