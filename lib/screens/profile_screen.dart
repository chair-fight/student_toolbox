import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/widgets/screen_app_bar.dart';
import 'package:student_toolbox/widgets/surface.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  const ProfileScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: "Profile",
        subScreen: true,
      ).get(context),
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
                      children: [
                        Container(
                          width: 200,
                          child: TextFormField(
                            initialValue: user.email,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: "Name",
                              isDense: true,
                            ),
                          ),
                        ),
                        Container(
                          width: 200,
                          child: TextFormField(
                            initialValue: "Babes Boyiai University",
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: "University",
                              isDense: true,
                            ),
                          ),
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
