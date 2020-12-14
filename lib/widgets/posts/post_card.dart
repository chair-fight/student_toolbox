import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/models/post_model.dart';
import 'package:student_toolbox/screens/post_screen.dart';
import 'file:///D:/Projects/student_toolbox/lib/widgets/group/group_mini.dart';
import 'file:///D:/Projects/student_toolbox/lib/widgets/profile/profile_mini.dart';
import '../containters/surface.dart';

class PostCard extends StatelessWidget {
  final PostModel post;
  final bool isDense;
  final bool navigateOnPress;

  const PostCard(
      {Key key, this.post, this.isDense = false, this.navigateOnPress = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Surface(
      onTap: navigateOnPress
          ? () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PostScreen(post: post)));
            }
          : null,
      children: [
        GroupMini(
          group: post.group,
          navigateOnPress: true,
        ),
        Container(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            post.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        if (isDense)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (post.text.isNotEmpty)
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      post.text,
                      style: Theme.of(context).textTheme.bodyText2,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                  ),
                ),
              if (post.image != null)
                Container(
                  padding: EdgeInsets.only(left: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      width: 100,
                      height: 64,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: post.image,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        if (!isDense)
          Container(
            child: Column(
              children: [
                if (post.text.isNotEmpty)
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      post.text,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                if (post.image != null)
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: post.image,
                    ),
                  ),
              ],
            ),
          ),
        Container(
          padding: EdgeInsets.only(top: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: ProfileMini(
                    user: post.op,
                  ),
                ),
              ),
              Container(
                child: Text(
                  "Less than a minute ago",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
