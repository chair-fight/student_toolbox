import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/screens/group_screen.dart';
import 'package:student_toolbox/widgets/surface.dart';

class GroupPreview extends StatelessWidget {
  final String name;
  final Image image;

  const GroupPreview({Key key, this.name = "", this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Surface(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => GroupScreen()));
      },
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      "https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg"),
                ),
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.only(left: 16),
                child: Wrap(
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.headline5,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
