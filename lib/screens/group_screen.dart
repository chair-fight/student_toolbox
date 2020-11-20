import 'package:flutter/material.dart';
import 'package:student_toolbox/models/group_model.dart';
import 'package:student_toolbox/widgets/group_preview.dart';
import 'package:student_toolbox/widgets/screen_app_bar.dart';

class GroupScreen extends StatelessWidget {
  final GroupModel group;

  const GroupScreen({Key key, this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: "Group",
        subScreen: true,
      ).get(context),
      body: ListView(
        children: [
          GroupPreview(group: group),
        ],
      ),
    );
  }
}
