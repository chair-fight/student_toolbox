import 'package:flutter/material.dart';
import 'package:student_toolbox/models/activity_model.dart';
import 'package:student_toolbox/services/firebase_data.dart';
import 'package:student_toolbox/widgets/activities/activity_edit_card.dart';
import 'package:student_toolbox/widgets/class_type/class_type_card.dart';
import 'package:student_toolbox/widgets/column_divider.dart';

class ActivityEditScreen extends StatefulWidget {
  final ActivityModel activityModel;

  const ActivityEditScreen({Key key, @required this.activityModel})
      : super(key: key);

  @override
  _ActivityEditScreenState createState() =>
      _ActivityEditScreenState(activityModel);
}

class _ActivityEditScreenState extends State<ActivityEditScreen> {
  final ActivityModel activityModel;

  _ActivityEditScreenState(this.activityModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Class"),
        leading: FlatButton(
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          RawMaterialButton(
            onPressed: () {},
            child: Icon(Icons.check),
          )
        ],
      ),
      body: ListView(
        children: [
              Form(
                child: Container(
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Activity Name*",
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Coordinator",
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Location",
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top: 16),
                        // child: ClassTypeCard(
                        //   activityLabelModel:
                        //       LocalData.getClassTypeModels().firstWhere((e) => e.id == activityModel.classTypeID),
                        //  onTap: () {},
                        //),
                      ),
                    ],
                  ),
                ),
              ),
              ColumnDivider(label: "Instances"),
            ] +
            [activityModel, activityModel]
                .map((e) => ActivityEditCard(
                      classModel: e,
                    ))
                .toList() +
            [
              TextButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.add,
                    size: 32,
                  ))
            ],
      ),
    );
  }
}
