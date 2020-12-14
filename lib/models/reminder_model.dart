import 'package:flutter/material.dart';

class ReminderModel {
  final String rid;
  final String text;

  ReminderModel({@required this.rid, @required this.text});

  static ReminderModel get placeholder {
    return ReminderModel(
      rid: "-1",
      text: "Reminder Placeholder",
    );
  }
}
