import 'package:flutter/material.dart';

class ButtonWithDot extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final Alignment dotAlignment;
  final Offset dotOffset;

  const ButtonWithDot({
    Key key,
    this.onPressed,
    this.child,
    this.dotAlignment = Alignment.topRight,
    this.dotOffset = Offset.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: dotAlignment,
        children: [
          IconButton(
            icon: child,
            onPressed: onPressed,
          ),
          Transform.translate(
            offset: dotOffset,
            child: Icon(
              Icons.circle,
              color: Theme.of(context).colorScheme.primary,
              size: 12,
            ),
          )
        ],
      ),
    );
  }
}
