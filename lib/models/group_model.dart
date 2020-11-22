import 'package:flutter/material.dart';
import 'package:student_toolbox/models/assignment_model.dart';
import 'package:student_toolbox/models/post_model.dart';
import 'package:student_toolbox/models/user_model.dart';

class GroupModel {
  final String id;
  final String name;
  final String description;
  final Image photo;
  GroupModel({
    this.id,
    this.name,
    this.description,
    this.photo,
  });
}
