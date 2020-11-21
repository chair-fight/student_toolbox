import 'package:flutter/material.dart';
import 'package:student_toolbox/models/group_model.dart';
import 'package:student_toolbox/models/user_model.dart';

class PostModel {
  final GroupModel group;
  final UserModel op;
  final String title;
  final String text;
  final Image image;
  final DateTime datePosted;

  PostModel({
    @required this.op,
    @required this.group,
    @required this.title,
    @required this.text,
    @required this.datePosted,
    this.image,
  });
}
