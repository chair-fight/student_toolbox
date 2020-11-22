import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/services/database.dart';
import 'package:student_toolbox/services/validators/nonempty_validator.dart';
import 'package:student_toolbox/widgets/button_primary.dart';
import 'package:student_toolbox/widgets/screen_app_bar.dart';
import 'package:student_toolbox/widgets/surface.dart';

import '../loading_screen.dart';

class CreateAssignmentScreen extends StatefulWidget {
  @override
  _CreateAssignmentScreenState createState() => _CreateAssignmentScreenState();
}

class _CreateAssignmentScreenState extends State<CreateAssignmentScreen> {
  String _name = '';
  String _description = '';
  DateTime _minDate = DateTime.now().add(Duration(days: 1));
  DateTime _dueDate = DateTime.now().add(Duration(days: 1));

  String _errorHint = '';

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  Future<void> _addBtnClick() async {
    final dueDate = DateTime(
      _dueDate.year,
      _dueDate.month,
      _dueDate.day,
    );
    if (_formKey.currentState.validate())
      try {
        setState(() {
          _isLoading = true;
        });
        Database.addUserAssignment(
            AuthService().currentUser.uid, _name, _description, dueDate);
        Navigator.pop(context);
      } catch (e) {
        setState(() {
          _errorHint = e.toString();
          _isLoading = false;
        });
      }
  }

  Future<void> _dateBtnClick() async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _minDate,
        firstDate: _minDate,
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        _dueDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? LoadingScreen()
        : Scaffold(
            appBar: ScreenAppBar(
              title: "Create New Private Assignment",
              subScreen: true,
            ).get(context),
            body: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Surface(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 32),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "Name",
                              ),
                              validator: NonEmptyValidator.validate,
                              onChanged: (value) {
                                setState(() => _name = value);
                              },
                            ),
                            TextFormField(
                              keyboardType: TextInputType.multiline,
                              maxLines: 10,
                              minLines: 5,
                              maxLength: 256,
                              maxLengthEnforced: true,
                              decoration: InputDecoration(
                                labelText: "Description",
                                alignLabelWithHint: true,
                                counterText: "${_description.length}/256",
                              ),
                              onChanged: (value) {
                                setState(() => _description = value);
                              },
                            ),
                            ButtonPrimary(
                              label: "Date: " +
                                  DateFormat('yyyy-MM-dd').format(_dueDate),
                              width: 148,
                              onPressed: _dateBtnClick,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 64, bottom: 8),
                              child: ButtonPrimary(
                                label: "Add",
                                width: 148,
                                onPressed: _addBtnClick,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
