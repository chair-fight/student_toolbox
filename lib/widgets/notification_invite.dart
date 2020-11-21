import 'package:flutter/material.dart';
import 'package:student_toolbox/models/group_model.dart';
import 'package:student_toolbox/widgets/group_preview.dart';
import 'package:student_toolbox/widgets/surface.dart';

import 'button_close.dart';
import 'button_primary.dart';

class NotificationInvite extends StatelessWidget {
  final GroupModel group;
  final DateTime dateTime;

  const NotificationInvite({Key key, @required this.group, this.dateTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Surface(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.person_add),
            VerticalDivider(),
            Text(
              "Pending friend request",
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6,
            ),
            Expanded(child: Container()),
            ButtonClose(
              onPressed: () {},
            ),
          ],
        ),
        Divider(),
        if (dateTime != null) Container(
          alignment: AlignmentDirectional.topEnd,
          child: Text(
            "${dateTime.day}/${dateTime.month}/${dateTime.year}",
            style: Theme
                .of(context)
                .textTheme
                .caption,
          ),
        ),
        GroupPreview(
          group: group,
          navigateOnPress: true,
        ),
        Container(
          padding: EdgeInsets.only(bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonPrimary(
                label: "Accept",
                width: 128,
                onPressed: () {},
              ),
              ButtonPrimary(
                label: "Decline",
                width: 128,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
