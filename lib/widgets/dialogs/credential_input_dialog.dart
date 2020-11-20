import 'package:flutter/material.dart';

class CredentialInputDialog extends StatefulWidget {
  @override
  _CredentialInputDialogState createState() => _CredentialInputDialogState();
}

class _CredentialInputDialogState extends State<CredentialInputDialog> {
  String _email = '';
  String _password = '';
  @override
  Widget build(BuildContext context) {
    return Form(
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
              decoration: InputDecoration(hintText: "Email"),
              onChanged: (value) => setState(() => _email = value),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Password"),
              obscureText: true,
              onChanged: (value) => setState(() => _password = value),
            ),
          ],
        ),
      ),
    );
  }
}
