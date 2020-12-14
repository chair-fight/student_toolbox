import 'package:flutter/material.dart';
import 'package:student_toolbox/models/group_model.dart';
import 'package:student_toolbox/screens/group_screen/group_screen.dart';
import 'package:student_toolbox/widgets/containters/surface.dart';

class GroupPreview extends StatelessWidget {
  final GroupModel group;
  final bool navigateOnPress;
  final bool isDense;
  final bool showDescription;

  const GroupPreview(
      {Key key,
      this.group,
      this.navigateOnPress = true,
      this.isDense = false,
      this.showDescription = true})
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                ClipOval(
                  child: Image.network(
                    "https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg",
                    height: isDense ? 48 : 64,
                    width: isDense ? 48 : 64,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            group.name,
                            style: Theme.of(context).textTheme.headline5,
                            overflow: TextOverflow.ellipsis,
                            maxLines: showDescription || isDense ? 1 : 2,
                          ),
                          if (showDescription)
                            Text(
                              group.description,
                              style: Theme.of(context).textTheme.caption,
                              overflow: TextOverflow.ellipsis,
                              maxLines: isDense ? 1 : 2,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (navigateOnPress)
              Container(
                width: 20,
                height: 20,
                alignment: Alignment.topRight,
                child: FlatButton(
                  padding: EdgeInsets.zero,
                  child: Icon(Icons.arrow_forward_ios, size: 16,),
                  onPressed: null,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
