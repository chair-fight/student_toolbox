import 'package:flutter/material.dart';
import 'package:student_toolbox/models/reminder_model.dart';

import 'button_close.dart';

class Reminder extends StatelessWidget {
  final ReminderModel reminderModel;

  const Reminder({Key key, this.reminderModel}) : super(key: key);

  Future _removeReminder() async {} // TODO - implement

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Row(
          children: [
            Text(reminderModel.text,
                style: Theme.of(context).textTheme.subtitle2),
            ButtonClose(onPressed: _removeReminder)
          ],
        ));
  }
}
