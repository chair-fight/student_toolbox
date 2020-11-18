import 'package:flutter/material.dart';
import 'package:student_toolbox/screens/register_screen.dart';
import 'home_screen.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(32),
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.primary),
            child: SizedBox(
              height: 164,
              width: double.infinity,
              child: FlutterLogo(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 32, right: 32, bottom: 32, top: 200),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 64),
            decoration: new BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: new BorderRadius.all(Radius.circular(8)),
            ),
            child: SizedBox(
              height: 600,
              child: ListView(
                children: [
                  Center(
                    child: Text(
                      "WELCOME",
                      style: TextStyle(
                        fontSize: 46,
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Email"),
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Password"),
                    obscureText: true,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 32, left: 32, right: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        RaisedButton(
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 20,
                            ),
                          ),
                          color: Theme.of(context).colorScheme.primary,
                          onPressed: () {},
                        ),
                        RaisedButton(
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 20,
                            ),
                          ),
                          color: Theme.of(context).colorScheme.primary,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()));
                          },
                        ),
                        RaisedButton(
                          child: Text(
                            "Skip",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 20,
                            ),
                          ),
                          color: Theme.of(context).colorScheme.primary,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
