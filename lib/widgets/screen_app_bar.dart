import 'package:flutter/material.dart';

class ScreenAppBar {
  final String title;
  final bool subScreen;
  final TabBar tabBar;

  const ScreenAppBar({this.tabBar, this.title, this.subScreen});

  AppBar get(BuildContext context) {
    return AppBar(
      leading: !subScreen ? null : FlatButton(
        child: Icon(
          Icons.arrow_back,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(title),
      bottom: tabBar,
    );
  }

}
