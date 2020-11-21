import 'package:flutter/material.dart';

class ButtonClose extends StatelessWidget {
  final Function onPressed;

  const ButtonClose({Key key, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16,
      height: 16,
      child: FlatButton (
        padding: EdgeInsets.zero,
        splashColor: Theme.of(context).colorScheme.secondary,
        child: Icon(
          Icons.close,
          size: 16,
          color: Colors.red,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
