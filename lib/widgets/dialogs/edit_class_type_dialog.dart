import 'package:flutter/material.dart';
import 'package:student_toolbox/models/class_type_model.dart';
import 'package:student_toolbox/widgets/class_type/class_type_card.dart';

class EditClassTypeDialog extends StatefulWidget {
  final ClassTypeModel classTypeModel;

  const EditClassTypeDialog({Key key, @required this.classTypeModel}) : super(key: key);

  @override
  _EditClassTypeDialogState createState() => _EditClassTypeDialogState(classTypeModel);
}

class _EditClassTypeDialogState extends State<EditClassTypeDialog> {
  final ClassTypeModel _classTypeModel;
  String _newLabel = '';
  Color _newColor = Colors.red;
  String _error = '';

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _EditClassTypeDialogState(this._classTypeModel);

  _confirmBtnClicked() {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    _newLabel = _classTypeModel.string;
    _newColor = _classTypeModel.color;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Editing Label"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: "Label"),
              onChanged: (value) => setState(() => _newLabel = value),
            ),
            Container(
              padding: EdgeInsets.only(top: 16),
              width: 250,
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Colors.red[900],
                  Colors.red[500],
                  Colors.red[300],
                  Colors.green[900],
                  Colors.green[500],
                  Colors.green[300],
                  Colors.blue[900],
                  Colors.blue[500],
                  Colors.blue[300],
                  Colors.orange[900],
                  Colors.orange[500],
                  Colors.orange[300],
                  Colors.purple[900],
                  Colors.purple[500],
                  Colors.purple[300],
                  Colors.brown[800],
                  Colors.brown[500],
                  Colors.brown[300],
                ]
                    .map((color) => Container(
                          width: 32,
                          height: 32,
                          margin: EdgeInsets.all(4),
                          child: ClipOval(
                            child: Material(
                              color: color,
                              child: InkWell(
                                onTap: () {},
                                child: Icon(Icons.bookmark, size: 16),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            Text(
              _error,
              style: TextStyle(color: Colors.red),
            ),
            ClassTypeCard(classTypeModel: ClassTypeModel(0, color: _newColor, string: _newLabel)),
            Divider(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text(
                    "Confirm",
                  ),
                  onPressed: (_newLabel.length > 0 && _newLabel.length < 24) ? _confirmBtnClicked : null,
                ),
                TextButton(
                  child: Text("Cancel"),
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
