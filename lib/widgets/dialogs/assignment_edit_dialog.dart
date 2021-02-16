import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:student_toolbox/models/assignment_model.dart';
import 'package:student_toolbox/models/assignment_model_private.dart';

class AssignmentEditDialog extends StatefulWidget {
  final AssignmentModel assignment;

  const AssignmentEditDialog({Key key, @required this.assignment}) : super(key: key);

  @override
  _AssignmentEditDialogState createState() => _AssignmentEditDialogState();
}

class _AssignmentEditDialogState extends State<AssignmentEditDialog> {
  String _name = '';
  DateTime _dueDate = DateTime.now();
  bool _isFinished = false;
  String _error = '';

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.assignment != null)
      setState(() {
        _name = widget.assignment.name;
        _dueDate = widget.assignment.dueDate;
        // TODO - Fix isFinished checkMark
        _isFinished = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(FontAwesomeIcons.pencilAlt, size: 20),
          SizedBox(width: 8),
          widget.assignment == null ? Text("New Assignment") : Text("Edit Assignment"),
        ],
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    initialValue: _name,
                    decoration: InputDecoration(hintText: "Assignment Name"),
                    onChanged: (value) => setState(() => _name = value),
                  ),
                ),
                Checkbox(
                  value: _isFinished,
                  onChanged: (value) => setState(() => _isFinished = value),
                ),
              ],
            ),
            SizedBox(height: 16),
            Flexible(
              child: Container(
                width: 1000,
                child: CalendarDatePicker(
                  initialDate: _dueDate,
                  firstDate: DateTime(2000, 11, 13),
                  lastDate: DateTime(2030, 11, 13),
                  onDateChanged: (DateTime value) {
                    setState(() => _dueDate = value);
                  },
                ),
              ),
            ),
            Text(
              _error,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ],
        ),
      ),
      actions: [
        Container(
          width: 100,
          child: OutlinedButton(
            child: Text("Cancel"),
            onPressed: () => Navigator.of(context).pop(null),
          ),
        ),
        Container(
          width: 100,
          child: ElevatedButton(
            child: Text("Confirm"),
            onPressed: () {
              Navigator.of(context).pop((widget.assignment == null)
                  // TODO - Add User ID when created
                  ? AssignmentModelPrivate(
                      aid: null,
                      name: _name,
                      dueDate: _dueDate,
                      isFinished: _isFinished,
                      uid: 0,
                    )
                  : AssignmentModelPrivate(
                      aid: widget.assignment.aid,
                      name: _name,
                      dueDate: _dueDate,
                      isFinished: _isFinished,
                      uid: 0,
                    ));
            },
          ),
        ),
      ],
    );
  }
}
