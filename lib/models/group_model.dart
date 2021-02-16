import 'package:flutter/material.dart';
import 'package:student_toolbox/models/model.dart';

class GroupModel implements Model {
  final int gid;
  final int uid;
  final String name;
  final String description;
  final List<int> adminUidList;
  final List<int> memberUidList;
  final List<int> scheduleSidList;
  final List<int> assignmentAidList;

  GroupModel({
    @required this.gid,
    @required this.uid,
    @required this.name,
    @required this.description,
    @required this.adminUidList,
    @required this.memberUidList,
    @required this.scheduleSidList,
    @required this.assignmentAidList,
  });

  @override
  GroupModel placeholder() => GroupModel(
        gid: 0,
        uid: 0,
        name: 'Lorem Ipsum',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mollis sagittis vestibulum.',
        adminUidList: [],
        memberUidList: [],
        scheduleSidList: [],
        assignmentAidList: [],
      );

  GroupModel fromJson(Map<String, dynamic> json) => GroupModel(
        gid: json['gid'],
        uid: json['uid'],
        name: json['name'],
        description: json['description'],
        // FIXME: Json list deserialization might not work like this
        adminUidList: json['adminUidList'],
        memberUidList: json['memberUidList'],
        scheduleSidList: json['scheduleSidList'],
        assignmentAidList: json['assignmentAidList'],
      );

  @override
  Map<String, dynamic> toJson() {
    return {
      'gid': gid,
      'uid': uid,
      'name': name,
      'description': description,
      // FIXME: Json list serialization might not work like this
      'adminUidList': adminUidList,
      'memberUidList': memberUidList,
      'scheduleSidList': scheduleSidList,
      'assignmentAidList': assignmentAidList,
    };
  }

  @override
  bool valid() {
    // TODO: implement valid
    throw UnimplementedError();
  }
}
