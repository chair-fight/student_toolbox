import 'package:flutter/material.dart';

class GroupModel {
  final String gid;
  final String name;
  final String description;
  final Image photo;

  GroupModel({
    @required this.gid,
    @required this.name,
    @required this.description,
    this.photo,
  });

  static GroupModel get placeholder {
    return GroupModel(
      gid: "-1",
      name: "Group Name",
      description: "Group Description",
      photo: Image.asset("images/image1.jpg")
    );
  }
}
