import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/models/user_model.dart';
import 'package:student_toolbox/screens/profile_screen.dart';

import 'surface.dart';

class ProfileMini extends StatelessWidget {
  final UserModel user;
  final bool navigateOnPress;

  const ProfileMini({Key key, this.user, this.navigateOnPress=true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ClipOval(
            child: Material(
              color: Theme.of(context).colorScheme.primary,
              child: InkWell(
                splashColor: Theme.of(context).colorScheme.secondary,
                child: Image.network(
                  "https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg",
                  height: 24,
                  width: 24,
                ),
                onTap: navigateOnPress
                    ? () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProfileScreen(user: user)));
                }
                    : null,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${user.name} ${user.surname}",
                  style: Theme.of(context).textTheme.caption,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
