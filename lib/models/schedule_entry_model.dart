import 'package:flutter/material.dart';
import 'package:student_toolbox/models/model.dart';

abstract class ScheduleEntryModel extends Model {
  int get seid;

  String get name;

  int get weekDay;

  TimeOfDay get startTime;

  Duration get duration;
}
