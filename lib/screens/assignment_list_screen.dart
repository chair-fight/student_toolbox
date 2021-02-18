import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:student_toolbox/models/assignment_model.dart';
import 'package:student_toolbox/widgets/app_bars/common_app_bar.dart';
import 'package:student_toolbox/widgets/assignment_card.dart';
import 'package:student_toolbox/widgets/dialogs/assignment_edit_dialog.dart';
import 'package:student_toolbox/widgets/loading_widget.dart';

class AssignmentListScreen extends StatefulWidget {
  @override
  _AssignmentListScreenState createState() => _AssignmentListScreenState();
}

class _AssignmentListScreenState extends State<AssignmentListScreen> {
  List<AssignmentModel> assignments;
  AssignmentModel focusedAssignment;

  String _error = ""; // TODO - Add better error prevention & communication

  @override
  void initState() {
    super.initState();
    refresh();
  }

  void refresh() async {
    // FIXME - Reimplement
    /*
    var fetchedAssignments = (await AssignmentModelFirebaseData.getAssignmentModels())
      ..sort(
        (lhs, rhs) => lhs.dueDate.compareTo(rhs.dueDate),
      );
    setState(() {
      assignments = fetchedAssignments;
    });*/
    setState(() {});
  }

  void _focusAssignmentCard(AssignmentModel assignment) {
    setState(() {
      focusedAssignment = focusedAssignment?.aid != assignment.aid ? assignment : null;
    });
  }

  void _createAssignment(AssignmentModel newAssignment) {
    // FIXME - Reimplement
    /*
    AssignmentModelFirebaseData.addAssignmentModel(newAssignment);
    refresh();
    */
  }

  void _editAssignment(AssignmentModel oldAssignment, AssignmentModel newAssignment) {
    // FIXME - Reimplement
    /*
    if (oldAssignment.aid == newAssignment.aid)
      AssignmentModelFirebaseData.updateAssignmentModel(newAssignment);
    else
      _error = "Something Failed";
     */
    refresh();
  }

  void _deleteAssignment(AssignmentModel oldAssignment) {
    // FIXME - Reimplement
    /*
    AssignmentModelFirebaseData.deleteAssignmentModel(oldAssignment.aid);
     */
    refresh();
  }

  List<AssignmentCard> _buildAssignmentCards(List<AssignmentModel> assignments) {
    if (assignments == null) return [];
    print("EXPANDED: " + (focusedAssignment != null ? "focusedAssignment.id" : "None"));
    return assignments
        .map((e) => AssignmentCard(
              assignment: e,
              onTap: _focusAssignmentCard,
              onEdit: _editAssignment,
              onDelete: _deleteAssignment,
              isExpanded: focusedAssignment != null && focusedAssignment.aid == e.aid,
            ))
        .toList()
          ..sort((lhs, rhs) => lhs.assignment.dueDate.compareTo(rhs.assignment.dueDate));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Text("Assignments"),
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        reverseDuration: Duration.zero,
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        transitionBuilder: (child, animation) {
          return FadeTransition(
            child: child,
            opacity: animation,
          );
        },
        child: assignments == null //
            ? LoadingWidget()
            : ListView(
                children: <Widget>[]
                  ..addAll([
                    [null, 0, "Late", Colors.red[400]],
                    [0, 7, "This Week", Colors.orange[300]],
                    [7, 30, "This Month", Colors.lightGreen[500]],
                    [30, null, "Later", Colors.lightBlue[300]],
                  ]
                      .map(
                        (setData) => _buildAssignmentCards(assignments)
                            .where((assignmentCard) =>
                                (setData[0] == null ? true : assignmentCard.assignment.dueDate.difference(DateTime.now()).inDays >= setData[0]) && //
                                (setData[1] == null ? true : assignmentCard.assignment.dueDate.difference(DateTime.now()).inDays < setData[1]))
                            .fold(
                          <Widget>[
                            if (assignments.any((assignment) =>
                                (setData[0] == null ? true : assignment.dueDate.difference(DateTime.now()).inDays >= setData[0]) && //
                                (setData[1] == null ? true : assignment.dueDate.difference(DateTime.now()).inDays < setData[1])))
                              IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Container(
                                      width: 10,
                                      decoration: BoxDecoration(color: setData[3], borderRadius: BorderRadius.only(topRight: Radius.circular(6))),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(setData[2], style: Theme.of(context).textTheme.headline6),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                          ],
                          (previousValue, element) => previousValue
                            ..add(
                              IntrinsicHeight(
                                child: Row(
                                  children: [
                                    Container(width: 4, color: setData[3]),
                                    Expanded(
                                      child: element,
                                    )
                                  ],
                                ),
                              ),
                            ),
                        ),
                      )
                      .reduce((value, element) => value + element))
                  ..addAll(
                    [
                      TextButton.icon(
                        icon: Icon(FontAwesomeIcons.plus, size: 14),
                        label: Text("Create New Assignment"),
                        onPressed: () => showDialog<AssignmentModel>(context: context, builder: (context) => AssignmentEditDialog(assignment: null)).then((value) => _createAssignment(value)),
                      ),
                    ],
                  ),
              ),
      ),
    );
  }
}
