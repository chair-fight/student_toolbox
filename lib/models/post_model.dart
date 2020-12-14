import 'package:flutter/material.dart';
import 'package:student_toolbox/models/group_model.dart';
import 'package:student_toolbox/models/user_model.dart';

class PostModel {
  final String pid;
  final UserModel op;
  final GroupModel group;
  final String title;
  final String text;
  final DateTime datePosted;
  final Image image;

  PostModel({
    @required this.pid,
    @required this.op,
    @required this.group,
    @required this.title,
    @required this.text,
    @required this.datePosted,
    this.image,
  });

  static PostModel get placeholder {
    return PostModel(
        pid: "-1",
        op: UserModel.placeholder,
        group: GroupModel.placeholder,
        title: "Post Title",
        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a tristique nibh. Donec nibh nibh, dictum at quam sit amet, suscipit efficitur ex. Etiam iaculis, risus in mattis luctus, tortor mauris gravida turpis, sed cursus diam massa vitae risus. Cras mi urna, dignissim eget purus sed, pellentesque hendrerit nisi. Integer consequat sollicitudin sapien sed lacinia. Quisque est metus, vulputate condimentum leo sed, egestas condimentum ante. Aenean sollicitudin bibendum ligula et faucibus. Maecenas laoreet rhoncus purus, nec finibus diam mollis at. Nulla non sapien urna. Nam ex velit, placerat ut hendrerit quis, pellentesque ac nulla. Praesent commodo egestas luctus. Nunc aliquet risus vel dui posuere, sed sollicitudin neque fringilla. Nulla venenatis tellus libero, at lobortis lorem rutrum vitae. Quisque id quam massa.",
        datePosted: DateTime(2000, 1, 1),
        image: Image.asset("images/image4.jpg"));
  }
}
