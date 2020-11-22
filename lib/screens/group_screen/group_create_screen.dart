import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/services/database.dart';
import 'package:student_toolbox/services/validators/nonempty_validator.dart';
import 'package:student_toolbox/widgets/button_primary.dart';
import 'package:student_toolbox/widgets/screen_app_bar.dart';
import 'package:student_toolbox/widgets/surface.dart';

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
      appBar: ScreenAppBar(
        title: "Create New Group",
        subScreen: true,
      ).get(context),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Surface(
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
          ],
        ),
      ),
    );
  }
}
