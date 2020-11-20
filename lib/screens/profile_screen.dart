import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/widgets/surface.dart';

class ProfileScreen extends StatelessWidget {
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
        title: Text("Profile"),
      ),
      body: ListView(
        children: [
          Surface(
            height: 144,
            children: [
              Row(
                children: [
                  Container(
                    height: 128,
                    width: 128,
                    child: Icon(
                      Icons.account_circle,
                      color: Theme.of(context).colorScheme.onBackground,
                      size: 128,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Darius Calugar",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          "\"Babeș Boyiai\" University",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Surface(
            padding: EdgeInsets.symmetric(horizontal: 32),
            children: [
              TextFormField(
                initialValue: "11/18/2020",
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Joined on",
                  isDense: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
