import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/models/group_model.dart';
import 'package:student_toolbox/screens/group_screen.dart';
import 'package:student_toolbox/widgets/surface.dart';

class GroupPreview extends StatelessWidget {
  final GroupModel group;
  final bool navigateOnPress;

  const GroupPreview({Key key, this.group, this.navigateOnPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Surface(
      onTap: (navigateOnPress != null)
          ? () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GroupScreen(group: group)));
            }
          : null,
      children: [
        Row(
          children: [
            Column(
              children: [
                ClipOval(
                  child: Image.network(
                    "https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg",
                    height: 64,
                    width: 64,
                  ),
                ),
              ],
            ),
            Flexible(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        group.name,
                        style: Theme.of(context).textTheme.headline5,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Divider(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
