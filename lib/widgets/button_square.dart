import 'package:flutter/material.dart';

class ButtonSquare extends StatelessWidget {
  final double size;
  final IconData icon;
  final Function onPressed;

  const ButtonSquare({Key key, this.size, this.onPressed, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(4),
      ),
      child: FlatButton(
        padding: EdgeInsets.zero,
        splashColor: Theme.of(context).colorScheme.secondary,
        child: Icon(
          icon,
          size: size * .7,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
