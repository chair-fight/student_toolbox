import 'package:flutter/material.dart';
import 'package:student_toolbox/models/model.dart';

class ScheduleEntryLabelModel implements Model {
  final int lid;
  final Color color;
  final String label;

  final int uid;

  ScheduleEntryLabelModel({
    @required this.lid,
    @required this.color,
    @required this.label,
    @required this.uid,
  });

  @override
  Model placeholder() => ScheduleEntryLabelModel(
        lid: 0,
        color: Colors.blueGrey,
        label: "Lorem",
        uid: 0,
      );

  ScheduleEntryLabelModel fromJson(Map<String, dynamic> json) => ScheduleEntryLabelModel(
        lid: json['lid'],
        color: json['color'],
        label: json['label'],
        uid: 0,
      );

  Map<String, dynamic> toJson() {
    return {
      'lid': lid,
      'color': color.value,
      'string': label,
      'uid': uid,
    };
  }

  @override
  bool valid() {
    // TODO: implement valid
    throw UnimplementedError();
  }
}
