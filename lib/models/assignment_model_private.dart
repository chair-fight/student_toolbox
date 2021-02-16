import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_toolbox/models/assignment_model.dart';

class AssignmentModelPrivate implements AssignmentModel {
  final int aid;
  final String name;
  final DateTime dueDate;

  final int uid;
  final bool isFinished;

  AssignmentModelPrivate({
    @required this.aid,
    @required this.name,
    @required this.dueDate,
    @required this.uid,
    @required this.isFinished,
  });

  @override
  AssignmentModelPrivate placeholder() => AssignmentModelPrivate(
        aid: 0,
        name: 'Lorem Ipsum',
        dueDate: DateTime.now(),
        uid: 0,
        isFinished: false,
      );

  @override
  AssignmentModelPrivate fromJson(Map<String, dynamic> json) => AssignmentModelPrivate(
        aid: json['aid'],
        name: json['name'],
        dueDate: json['dueDate'],
        uid: json['uid'],
        isFinished: json['isFinished'],
      );

  @override
  Map<String, dynamic> toJson() {
    return {
      'aid': aid,
      'name': name,
      'dueDate': DateFormat.yMd().format(dueDate),
      'uid': uid,
      'isFinished': isFinished,
    };
  }

  @override
  bool valid() {
    // TODO - Implement
    return true;
  }
}
