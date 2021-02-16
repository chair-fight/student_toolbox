import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:student_toolbox/art/gradients/primary_gradient.dart';
import 'package:student_toolbox/screens/loading_screen.dart';
import 'package:student_toolbox/screens/register_screen.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/services/validators/email_validator.dart';
import 'package:student_toolbox/services/validators/password_validator.dart';
import 'package:student_toolbox/widgets/column_divider.dart';

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
            body: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    gradient: PrimaryGradient().build(context),
                  ),
                  child: Image.asset("assets/images/logo_full_monoxxxhdpi.png"),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: Form(
                    key: _formKey,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(hintText: "Email", icon: Icon(FontAwesomeIcons.userAlt)),
                            validator: EmailValidator.validate,
                            onChanged: (value) => setState(() => _email = value),
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: "Password", icon: Icon(FontAwesomeIcons.key)),
                            obscureText: true,
                            validator: PasswordValidator.validate,
                            onChanged: (value) => setState(() => _password = value),
                          ),
                          Center(
                            child: Text(
                              _firebaseHint.isEmpty ? "" : _firebaseHint,
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          if (_resendUser != null)
                            OutlinedButton(
                              child: Text("Resend Email"),
                              onPressed: _resendBtnClick,
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  child: Text("Login"),
                                  onPressed: () async => await _signInBtnClick(),
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: OutlinedButton(
                                  child: Text("Register"),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(_setFirebaseHint)));
                                  },
                                ),
                              ),
                            ],
                          ),
                          ColumnDivider(label: "Login using"),
                          ElevatedButton(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(FontAwesomeIcons.facebookF, size: 16),
                                Text(" Facebook"),
                              ],
                            ),
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.blue[900]),
                              foregroundColor: MaterialStateProperty.all(Colors.white)
                            ),
                          ),
                          ElevatedButton(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(FontAwesomeIcons.google, size: 16),
                                Text(" Google"),
                              ],
                            ),
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.red),
                                foregroundColor: MaterialStateProperty.all(Colors.white)
                            ),
                          ),
                          TextButton(
                            child: Text("Login as guest"),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
