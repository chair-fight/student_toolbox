import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/models/user_model.dart';
import 'package:student_toolbox/screens/home_screen/profile_page.dart';
import 'package:student_toolbox/screens/loading_screen.dart';
import 'package:student_toolbox/services/database.dart';

import '../containters/surface.dart';

class ProfilePreview extends StatefulWidget {
  final User metaUser;
  final UserModel user;
  final bool isDense;
  final bool navigateOnPress;

  const ProfilePreview({Key key, this.metaUser, this.user, this.navigateOnPress = false, this.isDense = false})
      : super(key: key);

  @override
  _ProfilePreviewState createState() => _ProfilePreviewState(metaUser, user);
}

class _ProfilePreviewState extends State<ProfilePreview> {
  User metaUser;
  UserModel user;

  _ProfilePreviewState(this.metaUser, this.user);

  Future<void> _pullUser() async {
    user = await Database.getDBUser(metaUser);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: (user != null) ? Future.value() : _pullUser(),
      builder: (BuildContext context, AsyncSnapshot<void> buffer) {
        return (this.user == null)
            ? LoadingScreen()
            : Surface(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            ClipOval(
                              child: Container(
                                width: widget.isDense ? 48 : 64,
                                height: widget.isDense ? 48 : 64,
                                child: user.photo != null
                                    ? user.photo
                                    : Icon(
                                        Icons.account_circle,
                                        size: widget.isDense ? 48 : 64,
                                        color: Colors.grey,
                                      ),
                              ),
                            ),
                            ClipOval(
                              child: Container(
                                color: Theme.of(context).colorScheme.primary,
                                child: Icon(
                                  Icons.person_add,
                                  size: 16,
                                  color: Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${user.name} ${user.surname}",
                                  style: Theme.of(context).textTheme.headline5,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  "${user.university}",
                                  style: Theme.of(context).textTheme.subtitle1,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (widget.navigateOnPress)
                          Container(
                            width: 20,
                            height: 20,
                            alignment: Alignment.topRight,
                            child: FlatButton(
                              padding: EdgeInsets.zero,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              ),
                              onPressed: null,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                onTap: (widget.navigateOnPress)
                    ? () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(user: user)));
                      }
                    : null,
              );
      },
    );
  }
}
