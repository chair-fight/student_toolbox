import 'package:flutter/material.dart';
import 'package:student_toolbox/models/group_model.dart';
import 'package:student_toolbox/models/user_model.dart';

class PostModel {
  final String id;
  final GroupModel group;
  final UserModel op;
  final String title;
  final String text;
  final Image image;
  final DateTime datePosted;

  PostModel({
    this.id,
    @required this.op,
    @required this.group,
    @required this.title,
    @required this.text,
    @required this.datePosted,
    this.image,
  });
}
