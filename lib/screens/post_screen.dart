import 'package:flutter/material.dart';
import 'package:student_toolbox/models/post_model.dart';
import 'package:student_toolbox/widgets/posts/post_card.dart';

class PostScreen extends StatelessWidget {
  final PostModel post;

  const PostScreen({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post"),
        toolbarHeight: 40,
        leading: FlatButton(
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          PostCard(
            post: post,
            isDense: false,
            navigateOnPress: false,
          )
        ],
      ),
    );
  }
}
