import 'package:flutter/material.dart';
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
            name: "Databases",
          ),
          GroupPreview(
            name: "Advanced Programming Methods",
          ),
          GroupPreview(
            name: "Analysis",
          )
        ],
      ),
    );
  }
}
