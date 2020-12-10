import 'package:flutter/material.dart';
import 'package:student_toolbox/models/reminder_model.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/services/database.dart';
import 'package:student_toolbox/services/validators/nonempty_validator.dart';
import 'file:///D:/Projects/student_toolbox/lib/widgets/buttons/button_primary.dart';
import 'package:student_toolbox/widgets/reminders/reminder_list.dart';

import '../buttons/button_close.dart';

class ReminderAdd extends StatefulWidget {
  final ReminderList parent;

  const ReminderAdd({
    Key key,
    this.parent,
  }) : super(key: key);

  @override
  _ReminderStateAdd createState() => _ReminderStateAdd();
}

class _ReminderStateAdd extends State<ReminderAdd> {
  bool _editing = false;
  String _string = "";
  GlobalKey<FormState> key = GlobalKey<FormState>();

  void _addReminder(String value) {
    if (key.currentState.validate()) {
      Database.addReminder(AuthService().currentUser.uid, value);
    } else {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4),
      color: Theme.of(context).colorScheme.surface,
      child: Row(
        children: [
          Expanded(
            child: Form(
              key: key,
              child: TextFormField(
                validator: NonEmptyValidator.validate,
                onChanged: (value) => setState(() => _string = value),
                onFieldSubmitted: _addReminder,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(4),
                  isDense: true,
                  hintText: "Type here...",
                ),
              ),
            ),
          ),
          Container(
            width: 64,
            child: ButtonPrimary(
                label: "Add", onPressed: () => _addReminder(_string)),
          ),
        ],
      ),
    );
  }
}
