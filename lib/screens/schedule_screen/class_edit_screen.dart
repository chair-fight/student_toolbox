import 'package:flutter/material.dart';
import 'package:student_toolbox/widgets/screen_app_bar.dart';

class ClassEditScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: "Class Editor",
        subScreen: true,
      ).get(context),
    );
  }
}
