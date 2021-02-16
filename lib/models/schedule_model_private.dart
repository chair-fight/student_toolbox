import 'package:flutter/cupertino.dart';
import 'package:student_toolbox/models/schedule_model.dart';

class ScheduleModelPrivate implements ScheduleModel {
  final int sid;
  final String name;
  final List<int> scheduleEntrySeidList;

  final int uid;

  ScheduleModelPrivate({
    @required this.sid,
    @required this.name,
    @required this.scheduleEntrySeidList,
    @required this.uid,
  });

  @override
  ScheduleModelPrivate placeholder() => ScheduleModelPrivate(
        sid: 0,
        name: 'Lorem Ipsum',
        scheduleEntrySeidList: [],
        uid: 0,
      );

  @override
  ScheduleModelPrivate fromJson(Map<String, dynamic> json) => ScheduleModelPrivate(
        sid: json['sid'],
        name: json['name'],
        // FIXME: Json list deserialization might not work like this
        scheduleEntrySeidList: json['scheduleEntrySeidList'],
        uid: json['uid'],
      );

  @override
  Map<String, dynamic> toJson() {
    return {
      'sid': sid,
      'name': name,
      // FIXME: Json list serialization might not work like this
      'scheduleEntrySeidList': scheduleEntrySeidList,
      'uid': uid,
    };
  }

  @override
  bool valid() {
    // TODO: implement valid
    return true;
  }
}
