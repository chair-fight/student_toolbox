import 'package:flutter/material.dart';
import 'package:student_toolbox/models/group_model.dart';
import 'package:student_toolbox/models/post_model.dart';
import 'package:student_toolbox/models/user_model.dart';
import 'package:student_toolbox/widgets/posts/post_card.dart';

class PostFeed extends StatelessWidget {
  List<PostModel> data = [
    PostModel(
      pid: "-1",
      op: UserModel.placeholder,
      group: GroupModel.placeholder,
      title:
          "Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Title",
      text: "",
      datePosted: DateTime.now(),
    ),
    PostModel.placeholder,
    PostModel.placeholder,
    PostModel.placeholder,
    PostModel.placeholder,
    PostModel.placeholder,
    PostModel.placeholder,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: data
          .map((postModel) => PostCard(
                post: postModel,
                isDense: true,
                navigateOnPress: true,
              ))
          .toList(),
    );
  }
}
