import 'package:flutter/material.dart';
import 'package:student_toolbox/models/assignment_model.dart';
import 'package:student_toolbox/models/post_model.dart';
import 'package:student_toolbox/models/user_model.dart';

class GroupModel {
  final String name;
  final Image photo;
  final List<UserModel> admins;
  final List<UserModel> users;
  final List<PostModel> posts;
  final List<AssignmentModel> assignments;

  GroupModel({this.name, this.photo, this.admins, this.users, this.posts, this.assignments});
}