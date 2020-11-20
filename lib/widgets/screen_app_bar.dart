import 'package:flutter/material.dart';

class ScreenAppBar {
  final String title;
  final bool subScreen;
  final bool profileAccess;
  final TabBar tabBar;

  const ScreenAppBar(
      {this.profileAccess, this.tabBar, this.title, this.subScreen});

  AppBar get(BuildContext context) {
    return AppBar(
      title: Text(title),
      bottom: tabBar,
      leading: !subScreen
          ? null
          : FlatButton(
              child: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
    );
  }
}
