import 'package:flutter/material.dart';
import 'package:student_toolbox/models/reminder_model.dart';
import 'package:student_toolbox/widgets/button_primary.dart';
import 'package:student_toolbox/widgets/reminder.dart';
import 'package:student_toolbox/widgets/surface.dart';

class RemindersCard extends StatefulWidget {
  @override
  _RemindersCardState createState() => _RemindersCardState();
}

class _RemindersCardState extends State<RemindersCard> {
  List<Widget> _loadContent() {
    // TODO - use AuthService().currentUser and the rest api to get data
    var reminders = [
      ReminderModel(
        text: "Exam Soon",
      ),
      ReminderModel(
        text: "Assignments Due",
      ),
    ];
    return reminders
            .map((e) => Column(
                  children: [
                    Reminder(
                      reminderModel: e,
                    ),
                    Divider()
                  ],
                ))
            .toList()
            .cast<Widget>() +
        (reminders.length >= 5
            ? []
            : [
                ButtonPrimary(
                  label: "+",
                  onPressed: () {},
                )
              ]);
  }

  @override
  Widget build(BuildContext context) {
    return Surface(
      title: "Reminders",
      children: [
        Column(children: _loadContent()),
      ],
    );
  }
}
