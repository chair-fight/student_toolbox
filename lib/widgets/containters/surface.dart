import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Surface extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double height;
  final double width;
  final String title;
  final Color color;
  final Function onTap;

  Surface(
      {@required this.children,
      this.height,
      this.width = double.infinity,
      this.title = "",
      this.margin = const EdgeInsets.fromLTRB(2, 2, 2, 2),
      this.padding = const EdgeInsets.fromLTRB(2, 2, 2, 2),
      this.color,
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
                  margin: margin.add(EdgeInsets.only(left: 8)),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
          Container(
            margin: margin.subtract(EdgeInsets.only(top: 2)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Material(
                color: color != null
                    ? color
                    : Theme.of(context).colorScheme.surface,
                child: InkWell(
                  onTap: onTap,
                  splashColor: Theme.of(context).colorScheme.secondary,
                  child: Container(
                    width: width,
                    height: height,
                    padding: padding,
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
