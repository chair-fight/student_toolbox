import 'package:flutter/material.dart';
import 'package:student_toolbox/widgets/screen_app_bar.dart';

class GroupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: "Group",
        subScreen: true,
      ).get(context),
    );
  }
}
