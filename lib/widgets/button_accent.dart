import 'package:flutter/material.dart';

class ButtonAccent extends StatelessWidget {
  final String label;
  final Function onPressed;
  final double width;

  const ButtonAccent({Key key, this.label, this.onPressed, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: RaisedButton(
        child: Text(
          label,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        onPressed: onPressed,
      ),
    );
  }
}
