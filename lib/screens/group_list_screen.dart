import 'package:flutter/material.dart';
import 'package:student_toolbox/models/group_model.dart';
import 'package:student_toolbox/widgets/group_preview.dart';
import 'package:student_toolbox/widgets/screen_app_bar.dart';

class GroupListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: "Groups",
        subScreen: true,
      ).get(context),
      body: ListView(
        children: [
          GroupPreview(
            group: GroupModel(
              name: "Advanced Programming Methods",
            ),
            navigateOnPress: true,
          ),
          GroupPreview(
            group: GroupModel(
              name: "Databases",
            ),
            navigateOnPress: true,
          ),
          GroupPreview(
            group: GroupModel(
              name: "Analysis",
            ),
            navigateOnPress: true,
          ),
          GroupPreview(
            group: GroupModel(
              name: "Robotics & Engineering",
            ),
            navigateOnPress: true,
          ),
        ],
      ),
    );
  }
}
