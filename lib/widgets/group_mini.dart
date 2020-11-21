import 'package:flutter/material.dart';
import 'package:student_toolbox/models/group_model.dart';
import 'package:student_toolbox/screens/group_screen.dart';

class GroupMini extends StatelessWidget {
  final GroupModel group;
  final bool navigateOnPress;

  const GroupMini({Key key, this.group, this.navigateOnPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          children: [
            ClipOval(
              child: Material(
                color: Theme.of(context).colorScheme.primary,
                child: InkWell(
                  splashColor: Theme.of(context).colorScheme.secondary,
                  child: Image.network(
                    "https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg",
                    height: 24,
                    width: 24,
                  ),
                  onTap: navigateOnPress
                      ? () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      GroupScreen(group: group)));
                        }
                      : null,
                ),
              ),
            ),
            Container(
              child: Text(
                group.name,
                style: Theme.of(context).textTheme.caption,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
