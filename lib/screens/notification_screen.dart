import 'package:flutter/material.dart';
import 'package:student_toolbox/models/group_model.dart';
import 'package:student_toolbox/models/user_model.dart';
import 'package:student_toolbox/widgets/notification_add_friend.dart';
import 'package:student_toolbox/widgets/notification_invite.dart';
import 'package:student_toolbox/widgets/screen_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: "Notifications",
        subScreen: true,
      ).get(context),
      body: ListView(
        children: [
          NotificationAddFriend(user: UserModel.builtin1(), dateTime: DateTime.now()),
          NotificationAddFriend(user: UserModel.builtin2(), dateTime: DateTime.now()),
          NotificationInvite(group: GroupModel(name: "Mobile Development"), dateTime: DateTime.now()),
        ],
      ),
    );
  }
}
