import 'package:flutter/material.dart';
import 'package:student_toolbox/models/class_model.dart';
import 'package:student_toolbox/services/local_data.dart';
import 'package:student_toolbox/widgets/activities/activity_edit_card.dart';
import 'package:student_toolbox/widgets/class_type/class_type_card.dart';
import 'package:student_toolbox/widgets/column_divider.dart';

class ActivityEditScreen extends StatefulWidget {
  final ClassModel classModel;

  const ActivityEditScreen({Key key, @required this.classModel}) : super(key: key);

  @override
  _ActivityEditScreenState createState() => _ActivityEditScreenState(classModel);
}

class _ActivityEditScreenState extends State<ActivityEditScreen> {
  final ClassModel classModel;

  _ActivityEditScreenState(this.classModel);

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
                          child: ClassTypeCard(
                            classTypeModel:
                                ClassTypeModelLocalData.getClassTypeModels().firstWhere((e) => e.id == classModel.classTypeID),
                            onTap: () {},
                          )),
                    ],
                  ),
                ),
              ),
              ColumnDivider(label: "Instances"),
            ] +
            [classModel, classModel]
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
