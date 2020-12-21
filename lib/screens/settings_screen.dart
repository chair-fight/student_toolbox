import 'package:flutter/material.dart';
import 'package:student_toolbox/models/class_type_model.dart';
import 'package:student_toolbox/services/local_data.dart';
import 'package:student_toolbox/widgets/class_type/class_type_card.dart';
import 'package:student_toolbox/widgets/dialogs/create_class_type_dialog.dart';
import 'package:student_toolbox/widgets/dialogs/delete_account_dialog.dart';
import 'package:student_toolbox/widgets/dialogs/edit_class_type_dialog.dart';
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
            margin: EdgeInsets.only(left: 8, top: 8),
            child: Text(
              "Schedule",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 48,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 4),
                              child: Icon(Icons.access_time),
                            ),
                            Expanded(
                                child: Text("Show breaks in schedule", style: Theme.of(context).textTheme.subtitle2)),
                            Switch(
                              onChanged: (bool value) => true,
                              value: true,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 48,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 4),
                              child: Icon(Icons.bookmark),
                            ),
                            Expanded(child: Text("Edit Labels", style: Theme.of(context).textTheme.subtitle2)),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 24),
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          children: ClassTypeModelLocalData.getClassTypeModels()
                              .map((e) => ClassTypeCard(
                                    classTypeModel: e,
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => EditClassTypeDialog(classTypeModel: e),
                                      );
                                    },
                                  ))
                              .toList()
                                ..add(ClassTypeCard(
                                  classTypeModel: ClassTypeModel(0, color: Colors.grey[700], string: "+"),
                                  onTap: () {showDialog(
                                    context: context,
                                    builder: (context) => CreateClassTypeDialog(),
                                  );},
                                )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 8, top: 8),
            child: Text(
              "Danger Zone",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
          ),
          Signature(),
        ],
      ),
    );
  }
}
