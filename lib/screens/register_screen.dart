import 'package:flutter/material.dart';
import 'package:student_toolbox/widgets/signature.dart';
import 'package:student_toolbox/widgets/surface.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView(
        children: [
          Surface(
            padding: EdgeInsets.fromLTRB(32, 16, 32, 0),
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "Name"),
                    ),
                  ),
                  SizedBox(width: 32),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: "Surname"),
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Repeat Password"),
                obscureText: true,
              ),
              Container(
                width: 200,
                child: InputDatePickerFormField(
                  fieldLabelText: "Date of Birth",
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                ),
              ),
              Container(
                width: 200,
                child: DropdownButtonFormField(
                  items: [
                    DropdownMenuItem(child: Text("Male")),
                    DropdownMenuItem(child: Text("Female")),
                    DropdownMenuItem(child: Text("Other")),
                  ],
                  onChanged: (bool) {},
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 32),
                width: 150,
                child: RaisedButton(
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 20,
                    ),
                  ),
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {},
                ),
              ),
              Signature(),
            ],
          ),
        ],
      ),
    );
  }
}
