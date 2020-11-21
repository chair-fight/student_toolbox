import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/models/user_model.dart';
import 'package:student_toolbox/widgets/button_primary.dart';
import 'package:student_toolbox/widgets/button_close.dart';
import 'package:student_toolbox/widgets/profile_preview.dart';
import 'package:student_toolbox/widgets/surface.dart';

class NotificationAddFriend extends StatelessWidget {
  final UserModel user;
  final DateTime dateTime;

  const NotificationAddFriend({Key key, @required this.user, this.dateTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Surface(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.person_add,
              size: 32,
            ),
            VerticalDivider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Friend Request",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  "${dateTime.day}/${dateTime.month}/${dateTime.year}",
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
            Expanded(child: Container()),
            ButtonClose(
              onPressed: () {},
            ),
          ],
        ),
        Divider(),
        ProfilePreview(
          user: user,
          navigateOnPress: true,
          isDense: true,
        ),
        Container(
          padding: EdgeInsets.only(bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonPrimary(
                label: "Accept",
                width: 128,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
