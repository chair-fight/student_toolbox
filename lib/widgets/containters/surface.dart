import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Surface extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final Color color;
  final Function onTap;

  Surface({@required this.child, this.height, this.width = double.infinity, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Material(
                color: color != null ? color : Theme.of(context).colorScheme.surface,
                child: InkWell(
                  onTap: onTap,
                  splashColor: Theme.of(context).colorScheme.secondary,
                  child: Container(
                    width: width,
                    height: height,
                    child: child,
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
