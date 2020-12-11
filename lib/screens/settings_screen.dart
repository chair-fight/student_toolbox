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
          Container(
            margin: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                  child: Text(
                    "Schedule",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    children: [
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                  child: Text(
                    "Danger Zone",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 24,
                              child: RaisedButton(
                                color: Colors.red[800],
                                child: Text(
                                  "Reset App",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                          SizedBox(width: 4),
                          Expanded(
                            child: Container(
                              height: 24,
                              child: RaisedButton(
                                color: Colors.red[800],
                                child: Text(
                                  "Delete Account",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () => showDialog(context: context, builder: (_) => DeleteAccountDialog()),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Signature(),
        ],
      ),
    );
  }
}
