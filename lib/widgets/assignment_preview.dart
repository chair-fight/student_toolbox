import 'package:flutter/material.dart';
import 'package:student_toolbox/models/private_assignment_model.dart';
import 'package:student_toolbox/services/database.dart';

import 'buttons/button_primary.dart';
import 'containters/surface.dart';

class AssignmentPreview extends StatelessWidget {
  static var months = [
    "JAN",
    "FEB",
    "MAR",
    "APR",
    "MAY",
    "JUN",
    "JUL",
    "AUG",
    "SEP",
    "OCT",
    "NOV",
    "DEC"
  ];
  final PrivateAssignmentModel assignment;
  final bool navigateOnPress;
  final Function refreshParent;

  const AssignmentPreview(
      {Key key, this.assignment, this.navigateOnPress, this.refreshParent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Surface(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    assignment.name,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Text(
                    "${assignment.dueDate.day} ${months[assignment.dueDate.month - 1]} ${assignment.dueDate.year}",
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      assignment.description,
                    ),
                  ),
                  ButtonPrimary(
                    width: 100,
                    leading: Icons.check,
                    label: "Done",
                    onPressed: () async {
                      await Database.deleteUserAssignment(assignment.id);
                      if (refreshParent != null) refreshParent();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
      onTap: navigateOnPress ? () {} : null,
    );
  }
}
