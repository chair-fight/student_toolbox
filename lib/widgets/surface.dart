import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Surface extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double height;
  final double width;
  final String title;
  final Function onTap;

  Surface(
      {@required this.children,
      this.height,
      this.width = double.infinity,
      this.title = "",
      this.margin,
      this.padding,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title.isEmpty
              ? Container()
              : Container(
                  width: width,
                  margin: EdgeInsets.only(left: 16, right: 16, top: 8),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
          Container(
            margin: EdgeInsets.fromLTRB(8,4,8,4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Material(
                color: Theme.of(context).colorScheme.surface,
                child: InkWell(
                  onTap: onTap,
                  splashColor: Theme.of(context).colorScheme.secondary,
                  child: Container(
                    width: width,
                    height: height,
                    padding: EdgeInsets.all(8),
                    child: Container(
                      padding: padding,
                      child: Column(
                        children: children,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
