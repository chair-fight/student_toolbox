import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/models/user_model.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/widgets/button_accent.dart';
import 'package:student_toolbox/widgets/profile_preview.dart';
import 'package:student_toolbox/widgets/screen_app_bar.dart';
import 'package:student_toolbox/widgets/surface.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel user;

  const ProfileScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: "Profile",
        subScreen: true,
      ).get(context),
      body: ListView(
        children: [
          ProfilePreview(
            user: user,
            navigateOnPress: false,
          ),
          Surface(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonAccent(
                  label: "Add Friend",
                  leading: Icons.person_add,
                  width: 160,
                  onPressed: () {},
                ),
                ButtonAccent(
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
                  child: Text("Hello World :)")),
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
                initialValue: user.metaUser.email,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Email",
                  isDense: true,
                ),
              ),
              TextFormField(
                initialValue:
                    "${user.metaUser.metadata.creationTime.day}/${user.metaUser.metadata.creationTime.month}/${user.metaUser.metadata.creationTime.year}",
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Joined on",
                  isDense: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
