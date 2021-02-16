import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_toolbox/models/assignment_model.dart';

class AssignmentModelPrivate implements AssignmentModel {
  final int aid;
  final String name;
  final DateTime dueDate;

  final int gid;
  final List<int> finishedUidList;
  final List<int> needHelpUidList;

  AssignmentModelPrivate({
    @required this.aid,
    @required this.name,
    @required this.dueDate,
    @required this.gid,
    @required this.finishedUidList,
    @required this.needHelpUidList,
  });

  @override
  AssignmentModelPrivate placeholder() => AssignmentModelPrivate(
        aid: 0,
        name: 'Lorem Ipsum',
        dueDate: DateTime.now(),
        gid: 0,
        finishedUidList: [],
        needHelpUidList: [],
      );

  @override
  AssignmentModelPrivate fromJson(Map<String, dynamic> json) => AssignmentModelPrivate(
        aid: json['aid'],
        name: json['name'],
        dueDate: json['dueDate'],
        gid: json['gid'],
        // FIXME: Json list deserialization might not work like this
        finishedUidList: json['finishedUidList'],
        needHelpUidList: json['needHelpUidList'],
      );

  @override
  Map<String, dynamic> toJson() {
    return {
      'aid': aid,
      'name': name,
      'dueDate': DateFormat.yMd().format(dueDate),
      'gid': gid,
      // FIXME: Json list serialization might not work like this
      'finishedUidList': finishedUidList,
      'needHelpUidList': needHelpUidList,
    };
  }

  @override
  bool valid() {
    // TODO - Implement
    return true;
  }
}
