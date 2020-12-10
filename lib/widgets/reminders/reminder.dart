import 'package:flutter/material.dart';
import 'package:student_toolbox/models/reminder_model.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/services/database.dart';
import 'file:///D:/Projects/student_toolbox/lib/widgets/containters/surface.dart';

import '../buttons/button_close.dart';

class Reminder extends StatelessWidget {
  final ReminderModel reminderModel;
  final Function notifyParent;

  const Reminder({Key key, this.reminderModel, this.notifyParent})
      : super(key: key);

  Future _removeReminder() async {
    await Database.removeReminder(AuthService().currentUser.uid, reminderModel.rid);
    notifyParent.call();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reminderModel.text,
                            style: Theme.of(context).textTheme.subtitle2,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                alignment: AlignmentDirectional.topEnd,
                child: ButtonClose(onPressed: _removeReminder))
          ],
        ));
  }
}
