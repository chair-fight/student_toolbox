import 'package:flutter/material.dart';
import 'package:student_toolbox/widgets/assignment_preview.dart';
import 'package:student_toolbox/widgets/screen_app_bar.dart';

class AssignmentListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: ScreenAppBar(
            title: "Assignments",
            subScreen: true,
            tabBar: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.account_circle)),
                Tab(icon: Icon(Icons.person)),
              ],
            )).get(context),
        body: TabBarView(
          children: [
            ListView(
              children: [
                AssignmentPreview(),
                AssignmentPreview(),
                AssignmentPreview(),
                AssignmentPreview(),
              ],
            ),
            ListView(
              children: [
                AssignmentPreview(),
                AssignmentPreview(),
              ],
            ),
          ],
        )
      ),
    );
  }
}
