import 'package:flutter/material.dart';
import 'package:student_toolbox/screens/loading_screen.dart';
import 'package:student_toolbox/screens/register_screen.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/services/validators/email_validator.dart';
import 'package:student_toolbox/services/validators/password_validator.dart';
import 'home_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String _email = '';
  String _password = '';

  String _firebaseError = '';

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  Future _signInBtnClick() async {
    if (_formKey.currentState.validate()) {
      setState(() => _isLoading = true);
      try {
        await AuthService().emailSignIn(_email, _password);
      } catch (e) {
        setState(() {
          _firebaseError = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? LoadingScreen()
        : Scaffold(
            body: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(32),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary),
                  child: SizedBox(
                    height: 128,
                    width: double.infinity,
                    child: FlutterLogo(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: 32, right: 32, bottom: 32, top: 160),
                  decoration: new BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: new BorderRadius.all(Radius.circular(8)),
                  ),
                  child: ListView(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 64),
                        child: Form(
                          key: _formKey,
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                Center(
                                  child: Text(
                                    "WELCOME",
                                    style: TextStyle(
                                      fontSize: 46,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  decoration:
                                      InputDecoration(hintText: "Email"),
                                  validator: EmailValidator.validate,
                                  onChanged: (value) =>
                                      setState(() => _email = value),
                                ),
                                TextFormField(
                                  decoration:
                                      InputDecoration(hintText: "Password"),
                                  obscureText: true,
                                  validator: PasswordValidator.validate,
                                  onChanged: (value) =>
                                      setState(() => _password = value),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Text(
                                    _firebaseError.isEmpty
                                        ? ""
                                        : ("Authentication error: " +
                                            _firebaseError),
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 32, left: 32, right: 32),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      RaisedButton(
                                        child: Text(
                                          "Sign in",
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            fontSize: 20,
                                          ),
                                        ),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        onPressed: () async =>
                                            await _signInBtnClick(),
                                      ),
                                      RaisedButton(
                                        child: Text(
                                          "Register",
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            fontSize: 20,
                                          ),
                                        ),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      RegisterScreen()));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
