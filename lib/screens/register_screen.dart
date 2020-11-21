import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/services/validators/email_validator.dart';
import 'package:student_toolbox/services/validators/nonempty_validator.dart';
import 'package:student_toolbox/services/validators/password_validator.dart';
import 'package:student_toolbox/services/validators/repeat_password_validator.dart';
import 'package:student_toolbox/widgets/button_primary.dart';
import 'package:student_toolbox/widgets/signature.dart';
import 'package:student_toolbox/widgets/surface.dart';

import 'loading_screen.dart';

class RegisterScreen extends StatefulWidget {
  Function _setParentHint;

  RegisterScreen(Function setParentHint) {
    _setParentHint = setParentHint;
  }

  @override
  _RegisterScreenState createState() => _RegisterScreenState(_setParentHint);
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _name = '';
  String _surname = '';
  String _email = '';
  String _password = '';

  String _firebaseHint = '';

  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  Function _setParentHint;

  _RegisterScreenState(Function setParentHint) {
    _setParentHint = setParentHint;
  }

  Future _registerBtnPressed() async {
    if (_formKey.currentState.validate()) {
      setState(() => _isLoading = true);
      try {
        var user = await AuthService()
            .emailRegister(_email, _password, _name, _surname, 'ubb');
        await AuthService().sendVerificationEmail(user);
        _setParentHint(
            "Please confirm your email address by following the instructions sent to you at " +
                user.email);
        await AuthService().logOut();
        Navigator.of(context).pop();
      } on FirebaseAuthException catch (e) {
        setState(() => _firebaseHint = e.toString());
        setState(() => _isLoading = false);
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? LoadingScreen()
        : Scaffold(
            appBar: AppBar(
              leading: FlatButton(
                child: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text("Register"),
            ),
            body: Form(
              key: _formKey,
              child: Center(
                child: ListView(
                  children: [
                    Surface(
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 0),
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(labelText: "Name"),
                                validator: NonEmptyValidator.validate,
                                onChanged: (value) =>
                                    setState(() => _name = value),
                              ),
                            ),
                            SizedBox(width: 32),
                            Expanded(
                              child: TextFormField(
                                decoration:
                                    InputDecoration(labelText: "Surname"),
                                validator: NonEmptyValidator.validate,
                                onChanged: (value) =>
                                    setState(() => _surname = value),
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: "Email"),
                          validator: EmailValidator.validate,
                          onChanged: (value) => setState(() => _email = value),
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: "Password"),
                          obscureText: true,
                          validator: PasswordValidator.validate,
                          onChanged: (value) =>
                              setState(() => _password = value),
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: "Repeat Password"),
                          obscureText: true,
                          validator: (value) =>
                              RepeatPasswordValidator.validate(
                                  _password, value),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            _firebaseHint.isEmpty ? "" : _firebaseHint,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 32),
                          width: 150,
                          child: ButtonPrimary(
                            label: "Register",
                            onPressed: () async => await _registerBtnPressed(),
                          ),
                        ),
                        Signature(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
