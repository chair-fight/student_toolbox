import 'package:flutter/material.dart';
import 'package:student_toolbox/models/model.dart';
import 'package:student_toolbox/models/schedule_entry_model.dart';

class ScheduleEntryModelPublic implements ScheduleEntryModel {
  final int seid;
  final String name;
  final int weekDay;
  final TimeOfDay startTime;
  final Duration duration;
  final int labelLid;

  final int sid;

  ScheduleEntryModelPublic({
    @required this.seid,
    @required this.name,
    @required this.weekDay,
    @required this.startTime,
    @required this.duration,
    @required this.labelLid,
    @required this.sid,
  });

  @override
  Model fromJson(Map<String, dynamic> json) => ScheduleEntryModelPublic(
        seid: json['seid'],
        name: json['name'],
        weekDay: json['weekDay'],
        startTime: TimeOfDay(hour: json['startTime'] / 60, minute: json['startTime'] % 60),
        duration: Duration(minutes: json['duration']),
        labelLid: json['labelLid'],
        sid: json['sid'],
      );

  @override
  Model placeholder() => ScheduleEntryModelPublic(
        seid: 0,
        name: 'Lorem Ipsum Dolor Sit',
        weekDay: 0,
        startTime: const TimeOfDay(hour: 8, minute: 0),
        duration: const Duration(hours: 1),
        labelLid: 0,
        sid: 0,
      );

  @override
  Map<String, dynamic> toJson() {
    return {
      'seid': seid,
      'name': name,
      'weekDay': weekDay,
      'startTime': startTime.hour * 60 + startTime.minute,
      'duration': duration.inMinutes,
      'labelLid': labelLid,
      'sid': sid,
    };
  }

  @override
  bool valid() {
    // TODO: implement valid
    throw UnimplementedError();
  }
}
