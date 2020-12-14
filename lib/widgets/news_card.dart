import 'package:flutter/material.dart';
import 'file:///D:/Projects/student_toolbox/lib/widgets/containters/surface.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String text;
  final Image image;
  final DateTime dateTime;

  const NewsCard({Key key, this.title, this.text, this.image, this.dateTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Surface(
      children: [
        if (title != null)
          Container(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        Container(
          alignment: AlignmentDirectional.topEnd,
          child: Text(
            "Posted on 13/11/2020",
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        if (image != null)
          Container(
            padding: EdgeInsets.all(8),
            child: image,
          ),
        if (text != null)
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
      ],
    );
  }
}
