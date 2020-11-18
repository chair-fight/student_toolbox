import 'package:flutter/material.dart';

class Surface extends StatelessWidget {
  final List<Widget> children;
  final double height;
  final double width;
  final String title;

  Surface({this.children, this.height, this.width=double.infinity, this.title=""});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width,
          margin: EdgeInsets.only(left: 16, right: 16, top: 8),
          child: Text(title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Container(
          width: width,
          height: height,
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          decoration: new BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: new BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}
