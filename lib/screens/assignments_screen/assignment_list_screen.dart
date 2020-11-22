import 'package:flutter/material.dart';
import 'package:student_toolbox/models/assignment_model.dart';
import 'package:student_toolbox/models/private_assignment_model.dart';
import 'package:student_toolbox/screens/assignments_screen/create_assignment_screen.dart';
import 'package:student_toolbox/screens/loading_screen.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/services/database.dart';
import 'package:student_toolbox/widgets/column_divider.dart';
import 'package:student_toolbox/widgets/assignment_preview.dart';
import 'package:student_toolbox/widgets/screen_app_bar.dart';

class AssignmentListScreen extends StatefulWidget {
  @override
  _AssignmentListScreenState createState() => _AssignmentListScreenState();
}

class _AssignmentListScreenState extends State<AssignmentListScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: ScreenAppBar(
            title: "Assignments",
            subScreen: true,
            tabBar: TabBar(
              tabs: [
                Container(
                  height: 40,
                  child: Tab(
                    text: "Private",
                  ),
                ),
                Container(
                  height: 40,
                  child: Tab(
                    text: "Group",
                  ),
                ),
              ],
            )).get(context),
        body: TabBarView(
          children: [
            FutureBuilder(
              future: _groupAssignments(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return LoadingScreen();
                else if (snapshot.connectionState == ConnectionState.done)
                  return ListView(children: snapshot.data);
                // TODO - add error screen
              },
            ),
            ListView(
              children: [],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          splashColor: Theme.of(context).colorScheme.secondary,
          child: Icon(Icons.person_add),
          onPressed: () async {
            await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CreateAssignmentScreen()));
            setState(() {});
          },
        ),
      ),
    );
  }

  Future<List<Widget>> _groupAssignments() async {
    var assignments =
        await Database.getUserAssignments(AuthService().currentUser.uid);

    List<Widget> result = [];
    List<PrivateAssignmentModel> set;

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
      result.addAll(set.map((e) => AssignmentPreview(
          assignment: e,
          navigateOnPress: false,
          refreshParent: () => setState(() {}))));
    }

    set = assignments
        .where((element) => element.dueDate.difference(thisDay).inDays == 0)
        .toList();
    if (set.isNotEmpty) {
      result.add(ColumnDivider(label: "Due Today"));
      result.addAll(set.map((e) => AssignmentPreview(
          assignment: e,
          navigateOnPress: false,
          refreshParent: () => setState(() {}))));
    }

    set = assignments
        .where((element) => element.dueDate.difference(thisDay).inDays == 1)
        .toList();
    if (set.isNotEmpty) {
      result.add(ColumnDivider(label: "Due Tomorrow"));
      result.addAll(set.map((e) => AssignmentPreview(
          assignment: e,
          navigateOnPress: false,
          refreshParent: () => setState(() {}))));
    }

    set = assignments
        .where((element) => element.dueDate.difference(thisDay).inDays == 2)
        .toList();
    if (set.isNotEmpty) {
      result.add(ColumnDivider(label: "Due in 2 Days"));
      result.addAll(set.map((e) => AssignmentPreview(
          assignment: e,
          navigateOnPress: false,
          refreshParent: () => setState(() {}))));
    }

    set = assignments
        .where((element) =>
            element.dueDate.difference(thisDay).inDays > 2 &&
            element.dueDate.difference(thisDay).inDays <= 7)
        .toList();
    if (set.isNotEmpty) {
      result.add(ColumnDivider(label: "Due in less than 1 week"));
      result.addAll(set.map((e) => AssignmentPreview(
          assignment: e,
          navigateOnPress: false,
          refreshParent: () => setState(() {}))));
    }

    set = assignments
        .where((element) =>
            element.dueDate.difference(thisDay).inDays > 7 &&
            element.dueDate.difference(thisDay).inDays <= 14)
        .toList();
    if (set.isNotEmpty) {
      result.add(ColumnDivider(label: "Due in less than 2 weeks"));
      result.addAll(set.map((e) => AssignmentPreview(
          assignment: e,
          navigateOnPress: false,
          refreshParent: () => setState(() {}))));
    }

    set = assignments
        .where((element) =>
            element.dueDate.difference(thisDay).inDays > 14 &&
            element.dueDate.difference(thisDay).inDays <= 30)
        .toList();
    if (set.isNotEmpty) {
      result.add(ColumnDivider(label: "Due in less than 1 month"));
      result.addAll(set.map((e) => AssignmentPreview(
          assignment: e,
          navigateOnPress: false,
          refreshParent: () => setState(() {}))));
    }

    set = assignments
        .where((element) => element.dueDate.difference(thisDay).inDays > 30)
        .toList();
    if (set.isNotEmpty) {
      result.add(ColumnDivider(label: "Due Later"));
      result.addAll(set.map((e) => AssignmentPreview(
          assignment: e,
          navigateOnPress: false,
          refreshParent: () => setState(() {}))));
    }

    return result;
  }
}
