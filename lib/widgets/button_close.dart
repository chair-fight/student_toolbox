import 'package:flutter/material.dart';

class ButtonClose extends StatelessWidget {
  final Function onPressed;

  const ButtonClose({Key key, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      height: 32,
      child: FlatButton (
        padding: EdgeInsets.zero,
        splashColor: Theme.of(context).colorScheme.secondary,
        child: Icon(
          Icons.close,
          size: 24,
          color: Colors.red,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
