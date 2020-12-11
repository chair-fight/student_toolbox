import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/services/database.dart';
import 'package:student_toolbox/services/validators/nonempty_validator.dart';
import 'package:student_toolbox/widgets/buttons/button_primary.dart';
import 'package:student_toolbox/widgets/containters/surface.dart';

class GroupCreateScreen extends StatefulWidget {
  @override
  _GroupCreateScreenState createState() => _GroupCreateScreenState();
}

class _GroupCreateScreenState extends State<GroupCreateScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String _name = "";
  String _description = "";

  _createGroup() {
    Database.createGroup(AuthService().currentUser.uid, _name, _description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Group"),
        leading: FlatButton(
          child: Icon(
            Icons.arrow_back,
            color: Theme
                .of(context)
                .colorScheme
                .onPrimary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
      key: formKey,
      child: ListView(
        children: [
          Surface(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 32),
                  child: Column(
                    children: [
                      TextFormField(
                        maxLength: 50,
                        maxLengthEnforced: true,
                        decoration: InputDecoration(
                          labelText: "Name",
                          counterText: "${_name.length}/50",
                        ),
                        validator: NonEmptyValidator.validate,
                        onChanged: (value) {
                          setState(() {
                            _name = value;
                          });
                        },
                      ),
                      TextFormField(
                        maxLength: 256,
                        maxLengthEnforced: true,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        minLines: 5,
                        decoration: InputDecoration(
                          labelText: "Description",
                          alignLabelWithHint: true,
                          counterText: "${_description.length}/256",
                        ),
                        onChanged: (value) {
                          setState(() {
                            _description = value;
                          });
                        },
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 64, bottom: 8),
                        child: ButtonPrimary(
                          label: "Create",
                          width: 148,
                          onPressed: () {
                            _createGroup();
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),);
  }
}
