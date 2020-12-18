import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_toolbox/models/class_type_model.dart';
import 'package:student_toolbox/screens/loading_screen.dart';
import 'package:student_toolbox/services/firebase_data.dart';
import 'package:student_toolbox/services/theme_switcher.dart';
import 'package:student_toolbox/widgets/buttons/button_primary.dart';
import 'package:student_toolbox/widgets/buttons/button_secondary.dart';
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
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 4),
                        child: Text(
                          "Schedules",
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: FirebaseData.getSchedules()
                              .map((e) => Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 8),
                                  ))
                              .toList(),
                        ),
                      ),
                      Divider(),
                      Container(
                        margin: EdgeInsets.only(bottom: 4),
                        child: Text(
                          "Labels",
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                      StreamBuilder(
                          stream: ClassTypeModelFirebaseData
                              .getObservableClassTypeModels(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<ClassTypeModel>> snapshot) {
                            if (snapshot.hasError) {
                              return const Scaffold(
                                body: Center(
                                  child: Text(
                                      "Something went wrong"), // TODO - Make an error screen
                                ),
                              );
                            } else {
                              switch (snapshot.connectionState) {
                                case ConnectionState.none:
                                case ConnectionState.waiting:
                                  return LoadingScreen();
                                case ConnectionState.active:
                                case ConnectionState.done:
                                  return Container(
                                    child: Wrap(
                                      alignment: WrapAlignment.start,
                                      children: snapshot.data
                                          .map((e) => Container(
                                                margin: EdgeInsets.only(
                                                    bottom: 8, right: 8),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  child: Material(
                                                    color: e.color,
                                                    child: InkWell(
                                                      onTap: () {},
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 4,
                                                                horizontal: 8),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Icon(Icons.bookmark,
                                                                size: 16),
                                                            Text(e.string),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ))
                                          .toList()
                                            ..add(Container(
                                              margin: EdgeInsets.only(
                                                  bottom: 4, right: 8),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                child: Material(
                                                  color: Colors.grey[700],
                                                  child: InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 4,
                                                          horizontal: 8),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Icon(Icons.bookmark,
                                                              size: 16),
                                                          Text("+"),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )),
                                    ),
                                  );
                              }
                              return const Scaffold(
                                body: Center(
                                  child: Text(
                                      "Something went wrong"), // TODO - Make an error screen
                                ),
                              );
                            }
                          })
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
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
                                onPressed: () => showDialog(
                                    context: context,
                                    builder: (_) => DeleteAccountDialog()),
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
