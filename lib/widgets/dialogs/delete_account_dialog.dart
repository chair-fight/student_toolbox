import 'package:flutter/material.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/services/database.dart';
import 'package:student_toolbox/services/validators/email_validator.dart';
import 'package:student_toolbox/services/validators/password_validator.dart';

class DeleteAccountDialog extends StatefulWidget {
  @override
  _DeleteAccountDialogState createState() => _DeleteAccountDialogState();
}

class _DeleteAccountDialogState extends State<DeleteAccountDialog> {
  String _email = '';
  String _password = '';

  String _firebaseError = '';

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _confirmBtnClicked() async {
    if (_formKey.currentState.validate())
      try {
        var uid = AuthService().currentUser.uid;
        await AuthService().deleteAccount(_email, _password);
        await Database.deleteUser(uid);
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      } catch (e) {
        setState(() {
          _firebaseError = e.toString();
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Delete account?"),
      content: Center(
        heightFactor: 1,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "Email"),
                validator: EmailValidator.validate,
                onChanged: (value) => setState(() => _email = value),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Password"),
                obscureText: true,
                validator: PasswordValidator.validate,
                onChanged: (value) => setState(() => _password = value),
              ),
              Text(
                _firebaseError,
                style: TextStyle(color: Colors.red),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    child: Text(
                      "Confirm",
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: _confirmBtnClicked,
                  ),
                  FlatButton(
                    child: Text("Cancel"),
                    onPressed: () async {
                      Navigator.of(context).pop();
                      var x = await Database.getUserReminders(
                          AuthService().currentUser.uid);
                      print(x);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
