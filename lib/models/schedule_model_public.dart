import 'package:flutter/material.dart';
import 'package:student_toolbox/models/schedule_model.dart';

class ScheduleModelPublic implements ScheduleModel {
  final String name;
  final List<int> scheduleEntrySeidList;
  final int sid;

  final int gid;

  ScheduleModelPublic({
    @required this.sid,
    @required this.name,
    @required this.scheduleEntrySeidList,
    @required this.gid,
  });

  @override
  ScheduleModelPublic placeholder() => ScheduleModelPublic(
        sid: 0,
        name: 'Lorem Ipsum',
        scheduleEntrySeidList: [],
        gid: 0,
      );

  @override
  ScheduleModelPublic fromJson(Map<String, dynamic> json) => ScheduleModelPublic(
        sid: json['sid'],
        name: json['name'],
        // FIXME: Json list deserialization might not work like this
        scheduleEntrySeidList: json['scheduleEntrySeidList'],
        gid: json['gid'],
      );

  @override
  Map<String, dynamic> toJson() {
    return {
      'sid': sid,
      'name': name,
      // FIXME: Json list serialization might not work like this
      'scheduleEntrySeidList': scheduleEntrySeidList,
      'gid': gid,
    };
  }

  @override
  bool valid() {
    // TODO: implement valid
    return true;
  }
}
