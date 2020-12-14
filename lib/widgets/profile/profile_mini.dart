import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/models/user_model.dart';
import 'package:student_toolbox/screens/home_screen/profile_page.dart';
import 'package:student_toolbox/screens/loading_screen.dart';
import 'package:student_toolbox/services/database.dart';

import '../containters/surface.dart';

class ProfileMini extends StatefulWidget {
  final User metaUser;
  final UserModel user;
  final bool navigateOnPress;

  const ProfileMini(
      {Key key, this.metaUser, this.user, this.navigateOnPress = true})
      : super(key: key);

  @override
  _ProfileMiniState createState() => _ProfileMiniState(metaUser, user);
}

class _ProfileMiniState extends State<ProfileMini> {
  User metaUser;
  UserModel user;

  _ProfileMiniState(this.metaUser, this.user);

  Future<void> _pullUser() async {
    print(metaUser);
    user = await Database.getDBUser(metaUser);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: (user != null) ? Future.value() : _pullUser(),
      builder: (BuildContext context, AsyncSnapshot<void> buffer) {
        return (this.user == null)
            ? LoadingScreen()
            : Container(
                child: Row(
                  children: [
                    ClipOval(
                      child: Material(
                        color: Theme.of(context).colorScheme.primary,
                        child: InkWell(
                          child: Container(
                            width: 16,
                            height: 16,
                            child: user.photo != null
                                ? user.photo
                                : Icon(
                                    Icons.account_circle,
                                    size: 16,
                                    color: Theme.of(context).colorScheme.onPrimary,
                                  ),
                          ),
                          onTap: widget.navigateOnPress
                              ? () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProfilePage(user: user)));
                                }
                              : null,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${user.name} ${user.surname}",
                            style: Theme.of(context).textTheme.caption,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
      },
    );
  }
}
