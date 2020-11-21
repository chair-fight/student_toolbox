import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/models/user_model.dart';
import 'package:student_toolbox/screens/profile_screen.dart';

import 'surface.dart';

class ProfilePreview extends StatelessWidget {
  final UserModel user;
  final bool navigateOnPress;

  const ProfilePreview({Key key, this.user, this.navigateOnPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Surface(
      onTap: (navigateOnPress)
          ? () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileScreen(user: user)));
            }
          : null,
      children: [
        Row(
          children: [
            ClipOval(
              child: Container(
                width: 64,
                height: 64,
                child: user.photo,
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${user.name} ${user.surname}",
                      style: Theme.of(context).textTheme.headline5,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      "${user.university}",
                      style: Theme.of(context).textTheme.subtitle1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
