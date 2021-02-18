import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:student_toolbox/art/gradients/primary_gradient.dart';
import 'package:student_toolbox/screens/register_screen.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/services/validators/email_validator.dart';
import 'package:student_toolbox/services/validators/password_validator.dart';
import 'package:student_toolbox/widgets/common_text_form_field.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String _email = '';
  String _password = '';

  String _hint = '';

  final _formKey = GlobalKey<FormState>();

  User _resendUser; // the user to resend the email to

  void _setFirebaseHint(String hint) {
    setState(() => _hint = hint);
  }

  Future _signInBtnClick() async {
    if (_formKey.currentState.validate()) {
      try {
        var user = await AuthService().emailSignIn(_email.trim(), _password.trim());
        if (!user.emailVerified) {
          _hint = "You should verify your email address first. "
              "Press \"Resend Email to send a new verification email to the address you used here.\"";
          setState(() {
            _resendUser = user;
          });
        }
      } catch (e) {
        setState(() {
          _hint = e.toString();
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
      _hint = e.toString();
      return;
    }
    setState(() => _hint = "Email has been resent. Check your inbox");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ScrollConfiguration(
          behavior: new ScrollBehavior()..buildViewportChrome(context, null, AxisDirection.down),
          child: ListView(
            children: [
              SizedBox(
                height: 256,
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.elliptical(256, 64),
                    bottomEnd: Radius.elliptical(256, 64),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    decoration: BoxDecoration(
                      gradient: PrimaryGradient.build(context),
                    ),
                    child: Image.asset("assets/images/logo_full_oncolor.png"),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 64),
                child: Form(
                  key: _formKey,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 32),
                        Container(
                          height: 56,
                          alignment: Alignment.center,
                          child: CommonTextFormField(
                            decoration: InputDecoration(hintText: "Email"),
                            validator: EmailValidator.validate,
                            onChanged: (value) => setState(() => _email = value),
                          ),
                        ),
                        Container(
                          height: 56,
                          alignment: Alignment.center,
                          child: CommonTextFormField(
                            decoration: InputDecoration(hintText: "Password"),
                            obscureText: true,
                            validator: PasswordValidator.validate,
                            onChanged: (value) => setState(() => _password = value),
                          ),
                        ),
                        Center(
                          child: Text(
                            _hint.isEmpty ? "" : _hint,
                            style: TextStyle(color: Theme.of(context).colorScheme.error),
                          ),
                        ),
                        SizedBox(height: 16),
                        if (_resendUser != null)
                          OutlinedButton(
                            child: Text("Resend Email"),
                            onPressed: _resendBtnClick,
                          ),
                        SizedBox(width: 24),
                        ElevatedButton(
                          child: Text("Sign In"),
                          onPressed: () async => await _signInBtnClick(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                          child: Row(
                            children: [
                              Flexible(
                                child: Container(
                                  color: Theme.of(context).textTheme.caption.color,
                                  height: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text("OR", style: Theme.of(context).textTheme.caption),
                              ),
                              Flexible(
                                child: Container(
                                  color: Theme.of(context).textTheme.caption.color,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        OutlinedButton(
                          child: Text("Register"),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(_setFirebaseHint)));
                          },
                        ),
                        TextButton(
                          child: Text("I forgot my password"),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
