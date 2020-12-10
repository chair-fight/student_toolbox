import 'package:flutter/material.dart';

class ButtonSecondary extends StatelessWidget {
  final String label;
  final IconData leading;
  final IconData trailing;
  final Function onPressed;
  final double width;

  const ButtonSecondary(
      {Key key,
      this.label = "",
      this.onPressed,
      this.width,
      this.leading,
      this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: width,
      child: RaisedButton(
        elevation: 0,
        color: Theme.of(context).colorScheme.onPrimary,
        splashColor: Theme.of(context).colorScheme.secondary,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null)
              Icon(
                leading,
                color: Theme.of(context).colorScheme.primary,
              ),
            if (label.isNotEmpty)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  label,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            if (trailing != null)
              Icon(
                trailing,
                color: Theme.of(context).colorScheme.primary,
              ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        onPressed: onPressed,
      ),
    );
  }
}
