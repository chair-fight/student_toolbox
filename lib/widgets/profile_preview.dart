import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/models/user_model.dart';
import 'package:student_toolbox/screens/assignment_list_screen.dart';
import 'package:student_toolbox/screens/profile_screen.dart';

import 'surface.dart';

class ProfilePreview extends StatelessWidget {
  final UserModel user;
  final bool isDense;
  final bool navigateOnPress;

  const ProfilePreview(
      {Key key, this.user, this.navigateOnPress, this.isDense = false})
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                ClipOval(
                  child: Container(
                    width: isDense ? 48 : 64,
                    height: isDense ? 48 : 64,
                    child: user.photo,
                  ),
                ),
                ClipOval(
                  child: Container(
                    color: Theme.of(context).colorScheme.primary,
                    child: Icon(
                      Icons.person_add,
                      size: 16,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
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
            ),
            if (navigateOnPress)
              Container(
                width: 20,
                height: 20,
                alignment: Alignment.topRight,
                child: FlatButton(
                  padding: EdgeInsets.zero,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                  onPressed: null,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
