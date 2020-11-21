import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:student_toolbox/models/reminder_model.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/services/database.dart';
import 'package:student_toolbox/services/validators/nonempty_validator.dart';
import 'package:student_toolbox/widgets/button_primary.dart';
import 'package:student_toolbox/widgets/reminders/reminder.dart';
import 'package:student_toolbox/widgets/reminders/reminder_add.dart';
import 'package:student_toolbox/widgets/surface.dart';

class RemindersCard extends StatefulWidget {
  @override
  _RemindersCardState createState() => _RemindersCardState();
}

class _RemindersCardState extends State<RemindersCard> {
  bool _editing = false;
  String _string = "";
  GlobalKey<FormState> key = GlobalKey<FormState>();

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
      title: "Reminders",
      children: [
        FutureBuilder(
          future: Database.getUserReminders(AuthService().currentUser.uid),
          builder: (BuildContext context,
              AsyncSnapshot<List<ReminderModel>> buffer) {
            return (buffer.connectionState != ConnectionState.done)
                ? Container(
                    child: Center(
                      child: SpinKitWave(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  )
                : Column(
                    children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            alignment: Alignment.topLeft,
                            child: Text(
                              "${buffer.data.length}/10",
                              style: Theme.of(context).textTheme.caption,
                            ),
                          )
                        ] +
                        buffer.data
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
                        (buffer.data.length < 10
                            ? <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 8),
                                  color: Theme.of(context).colorScheme.surface,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Form(
                                          key: key,
                                          child: TextFormField(
                                            validator:
                                                NonEmptyValidator.validate,
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
                  );
          },
        ),
      ],
    );
  }
}
