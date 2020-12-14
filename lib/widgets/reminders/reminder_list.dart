import 'package:flutter/material.dart';
import 'package:student_toolbox/models/reminder_model.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/services/database.dart';
import 'package:student_toolbox/services/validators/nonempty_validator.dart';
import 'package:student_toolbox/widgets/containters/surface.dart';
import 'package:student_toolbox/widgets/reminders/reminder.dart';

class ReminderList extends StatefulWidget {
  @override
  _ReminderListState createState() => _ReminderListState();
}

class _ReminderListState extends State<ReminderList> {
  bool _editing = false;
  String _string = "";
  GlobalKey<FormState> key = GlobalKey<FormState>();

  List<ReminderModel> data = [
    ReminderModel.placeholder,
    ReminderModel.placeholder,
    ReminderModel.placeholder,
    ReminderModel.placeholder,
  ];

  void refresh() {
    setState(() {});
  }

  void _addReminder(String value) async {
    if (key.currentState.validate()) {
      await Database.addReminder(AuthService().currentUser.uid, value);
    } else {
      print("Error");
    }
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Surface(
      child: Column(
        children: [
          Column(
            children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "${data.length}/10",
                      style: Theme.of(context).textTheme.caption,
                    ),
                  )
                ] +
                data
                    .map(
                      (e) => Column(
                        children: [
                          Reminder(
                            reminderModel: e,
                            notifyParent: () {
                              refresh();
                            },
                          ),
                          Divider(),
                        ],
                      ),
                    )
                    .toList()
                    .cast<Widget>() +
                (data.length < 10
                    ? <Widget>[
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          color: Theme.of(context).colorScheme.surface,
                          child: Row(
                            children: [
                              Expanded(
                                child: Form(
                                  key: key,
                                  child: TextFormField(
                                    validator: NonEmptyValidator.validate,
                                    onFieldSubmitted: _addReminder,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(4),
                                      isDense: true,
                                      hintText: "Type here...",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ]
                    : <Widget>[]),
          ),
        ],
      ),
    );
  }
}
