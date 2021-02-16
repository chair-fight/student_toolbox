import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/services/validators/email_validator.dart';
import 'package:student_toolbox/services/validators/nonempty_validator.dart';
import 'package:student_toolbox/services/validators/password_validator.dart';
import 'package:student_toolbox/services/validators/repeat_password_validator.dart';

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
  String _repeatPassword = '';
  bool _agreeTOS = false;
  bool _agreeNewsletter = false;

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
        var user = await AuthService().emailRegister(_email, _password, _name, _surname, 'ubb');
        await AuthService().sendVerificationEmail(user);
        _setParentHint("Please confirm your email address by following the instructions sent to you at " + user.email);
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
                child: Icon(Icons.arrow_back),
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
                    Padding(
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(labelText: "Name"),
                                  validator: NonEmptyValidator.validate,
                                  onChanged: (value) => setState(() => _name = value),
                                ),
                              ),
                              SizedBox(width: 32),
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(labelText: "Surname"),
                                  validator: NonEmptyValidator.validate,
                                  onChanged: (value) => setState(() => _surname = value),
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
                            decoration: InputDecoration(labelText: "Password", suffixIcon: Icon(FontAwesomeIcons.eye)),
                            obscureText: true,
                            validator: PasswordValidator.validate,
                            onChanged: (value) => setState(() => _password = value),
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: "Repeat Password", suffixIcon: Icon(FontAwesomeIcons.eye)),
                            obscureText: true,
                            onChanged: (value) => setState(() => _repeatPassword = value),
                            validator: (value) => RepeatPasswordValidator.validate(_password, _repeatPassword),
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
                          Row(
                            children: [
                              Checkbox(
                                value: _agreeTOS,
                                onChanged: (bool value) => this.setState(() => _agreeTOS = value),
                              ),
                              Flexible(
                                child: RichText(
                                  text: TextSpan(
                                    style: Theme.of(context).textTheme.bodyText2,
                                    children: [
                                      TextSpan(text: "By checking this you agree with our "),
                                      TextSpan(
                                        text: "Terms of Service",
                                        style: TextStyle(color: Colors.lightBlueAccent, decoration: TextDecoration.underline),
                                        recognizer: TapGestureRecognizer()..onTap = () => {},
                                      ),
                                      TextSpan(text: "."),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: _agreeNewsletter,
                                onChanged: (bool value) => this.setState(() => _agreeNewsletter = value),
                              ),
                              Flexible(
                                child: RichText(
                                  text: TextSpan(
                                    text: "Subscribe to our newsletter.",
                                    style: Theme.of(context).textTheme.bodyText2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            child: Text("Register"),
                            onPressed: () async => await _registerBtnPressed(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
