import 'package:flutter/material.dart';
import 'package:student_toolbox/widgets/screen_app_bar.dart';
import 'package:student_toolbox/widgets/signature.dart';
import 'package:student_toolbox/widgets/surface.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: "Settings",
        subScreen: true,
      ).get(context),
      body: ListView(
        children: [
          Surface(
            title: "Account",
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Switch(value: false, onChanged: (bool) {}),
                      Text("Private Account"),
                      Icon(Icons.lock),
                    ],
                  ),
                ],
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
                children: [
                  Row(
                    children: [
                      Switch(value: false, onChanged: (bool) {}),
                      Text("Night Mode"),
                      Icon(Icons.brightness_3),
                    ],
                  )
                ],
              )
            ],
          ),
          Surface(
            title: "Danger Zone",
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: RaisedButton(
                      color: Colors.red[800],
                      child: Text(
                        "Reset App",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Container(width: 8),
                  Expanded(
                    child: RaisedButton(
                      color: Colors.red[800],
                      child: Text(
                        "Delete Account",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
          Signature(),
        ],
      ),
    );
  }
}
