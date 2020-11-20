import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/services/auth.dart';

class DeleteAccountDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(10),
      title: Text("Delete account?"),
      content: Text(
          "Are you sure you want to delete your account? This action cannot be undone!"),
      actions: [
        FlatButton(
          child: Text(
            "Delete account",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          onPressed: () async {
            try {
              await AuthService().deleteAccount();
            } on FirebaseAuthException {
              
            }
          },
        ),
        FlatButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            })
      ],
    );
  }
}
