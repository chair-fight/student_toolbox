import 'package:flutter/material.dart';
import 'package:student_toolbox/models/post_model.dart';
import 'package:student_toolbox/widgets/group_mini.dart';
import 'surface.dart';

class PostCard extends StatelessWidget {
  final PostModel post;

  const PostCard({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Surface(
      children: [
        GroupMini(
          group: post.group,
          navigateOnPress: true,
        ),
        Divider(),
        Container(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            post.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Divider(),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            post.text,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: post.image,
        ),
        Container(
          alignment: AlignmentDirectional.topEnd,
          child: Text(
            "13/11/2020",
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ],
    );
  }
}
