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
          NotificationAddFriend(
              user: UserModel.builtin1(), dateTime: DateTime.now()),
          NotificationAddFriend(
              user: UserModel.builtin2(), dateTime: DateTime.now()),
          NotificationInvite(
              group: GroupModel(
                  name: "Mobile Development",
                  description:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi volutpat mattis enim, et feugiat massa malesuada ac. Donec ut maximus odio. Sed congue gravida sodales. Suspendisse imperdiet massa vitae mi feugiat venenatis. Aliquam posuere purus vel dolor vehicula, eget sodales massa varius. Nulla gravida nibh ipsum, nec consectetur nulla sodales non. Morbi in magna metus. Duis et lorem eget felis bibendum mollis. Vivamus sollicitudin eget leo vitae varius. Suspendisse vitae lacus venenatis, facilisis turpis nec, dignissim diam. Phasellus quis turpis quis odio facilisis fermentum ut nec turpis. Nunc sollicitudin augue quis libero semper efficitur. Cras volutpat interdum lacus, vitae vehicula arcu gravida vitae. Nunc ac elit hendrerit nisi dignissim accumsan. Sed nec ex enim. Ut auctor massa turpis."),
              dateTime: DateTime.now()),
        ],
      ),
    );
  }
}
