import 'package:flutter/material.dart';
import 'package:student_toolbox/models/assignment_model.dart';
import 'package:student_toolbox/widgets/button_accent.dart';
import 'package:student_toolbox/widgets/button_square.dart';
import 'package:student_toolbox/widgets/surface.dart';

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
  final AssignmentModel assignment;
  final bool navigateOnPress;

  const AssignmentPreview({Key key, this.assignment, this.navigateOnPress})
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
                  ButtonAccent(
                    width: 100,
                    leading: Icons.check,
                    label: "Done",
                    onPressed: () {},
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
