import 'package:flutter/material.dart';
import 'package:student_toolbox/widgets/profile_preview.dart';
import 'package:student_toolbox/widgets/screen_app_bar.dart';
import 'package:student_toolbox/widgets/search_bar.dart';

class FriendSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: "Add Friend",
        subScreen: true,
      ).get(context),
      body: Container(
        child: Column(
          children: [
            SearchBar(),
            Divider(),
            Expanded(
              child: ListView(
                children: []
                    .map((e) => ProfilePreview(user: e, navigateOnPress: true))
                    .cast<Widget>()
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
