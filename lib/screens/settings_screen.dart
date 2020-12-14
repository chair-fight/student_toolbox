import 'package:flutter/material.dart';
import 'package:student_toolbox/services/theme_switcher.dart';
import 'package:student_toolbox/widgets/containters/surface.dart';
import 'package:student_toolbox/widgets/dialogs/delete_account_dialog.dart';
import 'package:student_toolbox/widgets/signature.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        leading: FlatButton(
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          Surface(
            title: "Account",
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
                children: [
                  Row(
                    children: [
                      Switch(
                          value: themeSwitcher.isDark,
                          onChanged: (bool) async {
                            await themeSwitcher.switchTheme();
                          }),
                      Text("Night Mode"),
                      Icon(themeSwitcher.isDark
                          ? Icons.brightness_3
                          : Icons.brightness_7),
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
                      onPressed: () => showDialog(
                          context: context,
                          builder: (_) => DeleteAccountDialog()),
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
