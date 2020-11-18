import 'package:flutter/material.dart';
import 'package:student_toolbox/widgets/surface.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Settings"),
      ),
      body: ListView(
        children: [
          Surface(
            title: "Profile",
            children: [
              Row(
                children: [],
              )
            ],
          ),
          Surface(
            title: "Preferences",
            children: [
              Row(
                children: [],
              )
            ],
          ),
          Surface(
            title: "Accessibility",
            children: [
              Row(
                children: [],
              )
            ],
          ),
        ],
      ),
    );
  }
}
