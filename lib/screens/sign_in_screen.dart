import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/screens/loading_screen.dart';
import 'package:student_toolbox/screens/register_screen.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/services/validators/email_validator.dart';
import 'package:student_toolbox/services/validators/password_validator.dart';
import 'package:student_toolbox/widgets/button_primary.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String _email = '';
  String _password = '';

  String _firebaseHint = '';

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  User _resendUser; // the user to resend the email to

  void _setFirebaseHint(String hint) {
    setState(() => _firebaseHint = hint);
  }

  Future _signInBtnClick() async {
    if (_formKey.currentState.validate()) {
      setState(() => _isLoading = true);
      try {
        var user = await AuthService().emailSignIn(_email, _password);
        if (!user.emailVerified) {
          _firebaseHint = "You should verify your email address first. "
              "Press \"Resend Email to send a new verification email to the address you used here.\"";
          setState(() {
            _isLoading = false;
            _resendUser = user;
          });
        }
      } catch (e) {
        setState(() {
          _firebaseHint = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  Future _resendBtnClick() async {
    try {
      await AuthService().sendVerificationEmail(_resendUser);
      await AuthService().logOut();
      _resendUser = null;
    } catch (e) {
      _firebaseHint = e.toString();
      return;
    }
    setState(() => _firebaseHint = "Email has been resent. Check your inbox");
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
                                Divider(),
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
                                    _firebaseHint.isEmpty ? "" : _firebaseHint,
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
                                      ButtonPrimary(
                                        label: "Sign in",
                                        onPressed: () async =>
                                            await _signInBtnClick(),
                                      ),
                                      Divider(),
                                      ButtonPrimary(
                                        label: "Register",
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      RegisterScreen(
                                                          _setFirebaseHint)));
                                        },
                                      ),
                                      _resendUser == null
                                          ? Container()
                                          : Column(
                                              children: [
                                                Divider(),
                                                ButtonPrimary(
                                                  label: "Resend Email",
                                                  onPressed: _resendBtnClick,
                                                ),
                                              ],
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
