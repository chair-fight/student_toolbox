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
            Icon(
              Icons.group_add,
              size: 32,
            ),
            VerticalDivider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Group Invite",
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline6,
                ),
                Text(
                  "${dateTime.day}/${dateTime.month}/${dateTime.year}",
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
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
        ),
        GroupPreview(
          group: group,
          navigateOnPress: true,
          isDense: true,
        ),
        Container(
          padding: EdgeInsets.only(bottom: 4),
          child: ButtonPrimary(
            label: "Accept",
            width: 128,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
