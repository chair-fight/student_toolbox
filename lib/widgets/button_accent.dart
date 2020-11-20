import 'package:flutter/material.dart';

class ButtonAccent extends StatelessWidget {
  final String label;
  final IconData leading;
  final IconData trailing;
  final Function onPressed;
  final double width;

  const ButtonAccent(
      {Key key,
      this.label,
      this.onPressed,
      this.width,
      this.leading,
      this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: RaisedButton(
        color: Theme.of(context).colorScheme.primary,
        splashColor: Theme.of(context).colorScheme.secondary,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            leading != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(leading),
                  )
                : Container(),
            Text(
              label,
            ),
            trailing != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Icon(trailing),
                  )
                : Container(),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        onPressed: onPressed,
      ),
    );
  }
}
