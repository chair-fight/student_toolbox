import 'package:flutter/material.dart';
import 'package:student_toolbox/models/assignment_model.dart';
import 'package:student_toolbox/widgets/column_divider.dart';
import 'package:student_toolbox/widgets/assignment_preview.dart';
import 'package:student_toolbox/widgets/screen_app_bar.dart';

class AssignmentListScreen extends StatelessWidget {
  final List<AssignmentModel> assignments = [
    AssignmentModel(
      name: "Assignment -1",
      description:
          "Description description description description description description description",
      dueDate: new DateTime(2020, 10, 20),
    ),
    AssignmentModel(
      name: "Assignment 0",
      description:
          "Description description description description description description description",
      dueDate: new DateTime(2020, 11, 20),
    ),
    AssignmentModel(
      name: "Assignment 1",
      description:
          "Description description description description description description description",
      dueDate: new DateTime(2020, 11, 20),
    ),
    AssignmentModel(
      name: "Assignment 2",
      description:
          "Description description description description description description description",
      dueDate: new DateTime(2020, 11, 21),
    ),
    AssignmentModel(
      name: "Assignment 3",
      description:
          "Description description description description description description description",
      dueDate: new DateTime(2020, 11, 27),
    ),
    AssignmentModel(
      name: "Assignment 4",
      description:
          "Description description description description description description description",
      dueDate: new DateTime(2020, 11, 29),
    ),
    AssignmentModel(
      name: "Assignment 5",
      description:
          "Description description description description description description description",
      dueDate: new DateTime(2020, 12, 12),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: ScreenAppBar(
            title: "Assignments",
            subScreen: true,
            tabBar: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.check_circle),
                  text: "Completed",
                ),
                Tab(
                  icon: Icon(Icons.person),
                  text: "Private",
                ),
                Tab(
                  icon: Icon(Icons.group),
                  text: "Group",
                ),
              ],
            )).get(context),
        body: TabBarView(
          children: [
            ListView(
              children: [],
            ),
            ListView(children: groupAssignments(assignments)),
            ListView(
              children: [],
            ),
          ],
        ),
      ),
    );
  }

  static List<Widget> groupAssignments(List<AssignmentModel> assignments) {
    List<Widget> result = [];
    List<AssignmentModel> set;

    DateTime thisDay = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );

    set = assignments
        .where((element) => element.dueDate.difference(thisDay).inDays < 0)
        .toList();
    if (set.isNotEmpty) {
      result.add(ColumnDivider(
        label: "Late",
      ));
      result.addAll(set
          .map((e) => AssignmentPreview(assignment: e, navigateOnPress: true)));
    }

    set = assignments
        .where((element) => element.dueDate.difference(thisDay).inDays == 0)
        .toList();
    if (set.isNotEmpty) {
      result.add(ColumnDivider(label: "Due Today"));
      result.addAll(set
          .map((e) => AssignmentPreview(assignment: e, navigateOnPress: true)));
    }

    set = assignments
        .where((element) => element.dueDate.difference(thisDay).inDays == 1)
        .toList();
    if (set.isNotEmpty) {
      result.add(ColumnDivider(label: "Due Tomorrow"));
      result.addAll(set
          .map((e) => AssignmentPreview(assignment: e, navigateOnPress: true)));
    }

    set = assignments
        .where((element) => element.dueDate.difference(thisDay).inDays == 2)
        .toList();
    if (set.isNotEmpty) {
      result.add(ColumnDivider(label: "Due in 2 Days"));
      result.addAll(set
          .map((e) => AssignmentPreview(assignment: e, navigateOnPress: true)));
    }

    set = assignments
        .where((element) =>
            element.dueDate.difference(thisDay).inDays > 2 &&
            element.dueDate.difference(thisDay).inDays <= 7)
        .toList();
    if (set.isNotEmpty) {
      result.add(ColumnDivider(label: "Due in less than 1 week"));
      result.addAll(set
          .map((e) => AssignmentPreview(assignment: e, navigateOnPress: true)));
    }

    set = assignments
        .where((element) =>
            element.dueDate.difference(thisDay).inDays > 7 &&
            element.dueDate.difference(thisDay).inDays <= 14)
        .toList();
    if (set.isNotEmpty) {
      result.add(ColumnDivider(label: "Due in less than 2 weeks"));
      result.addAll(set
          .map((e) => AssignmentPreview(assignment: e, navigateOnPress: true)));
    }

    set = assignments
        .where((element) =>
            element.dueDate.difference(thisDay).inDays > 14 &&
            element.dueDate.difference(thisDay).inDays <= 30)
        .toList();
    if (set.isNotEmpty) {
      result.add(ColumnDivider(label: "Due in less than 1 month"));
      result.addAll(set
          .map((e) => AssignmentPreview(assignment: e, navigateOnPress: true)));
    }

    set = assignments
        .where((element) => element.dueDate.difference(thisDay).inDays > 30)
        .toList();
    if (set.isNotEmpty) {
      result.add(ColumnDivider(label: "Due Later"));
      result.addAll(set
          .map((e) => AssignmentPreview(assignment: e, navigateOnPress: true)));
    }

    return result;
  }
}
