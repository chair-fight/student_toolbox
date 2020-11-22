import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/models/group_model.dart';
import 'package:student_toolbox/models/post_model.dart';
import 'package:student_toolbox/models/user_model.dart';
import 'package:student_toolbox/screens/assignments_screen/assignment_list_screen.dart';
import 'package:student_toolbox/screens/friend_list_screen/friend_list_screen.dart';
import 'package:student_toolbox/screens/loading_screen.dart';
import 'package:student_toolbox/services/database.dart';
import 'package:student_toolbox/screens/group_screen/group_list_screen.dart';
import 'package:student_toolbox/screens/news_screen.dart';
import 'package:student_toolbox/screens/notification_screen.dart';
import 'package:student_toolbox/screens/profile_screen.dart';
import 'package:student_toolbox/screens/schedule_screen/schedule_screen.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/screens/scanner_screen.dart';
import 'package:student_toolbox/screens/settings_screen.dart';
import 'package:student_toolbox/widgets/post_card.dart';
import 'package:student_toolbox/widgets/reminders/reminders_card.dart';
import 'package:student_toolbox/widgets/screen_app_bar.dart';
import 'package:student_toolbox/widgets/signature.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ScreenAppBar(
          title: "Dashboard",
          subScreen: false,
        ).get(context),
        drawer: Drawer(
          elevation: 0,
          child: ListView(
            children: [
              DrawerHeader(
                child: FlutterLogo(),
              ),
              ListTile(
                visualDensity: VisualDensity.compact,
                leading: Icon(Icons.person_search),
                title: Text("Friends"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FriendListScreen()));
                },
              ),
              ListTile(
                visualDensity: VisualDensity.compact,
                leading: Icon(Icons.account_circle),
                title: Text("Groups"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GroupListScreen()));
                },
              ),
              ListTile(
                visualDensity: VisualDensity.compact,
                leading: Icon(Icons.backup_table),
                title: Text("Assignments"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AssignmentListScreen()));
                },
              ),
              ListTile(
                visualDensity: VisualDensity.compact,
                leading: Icon(Icons.calendar_today),
                title: Text("Schedule"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScheduleScreen()));
                },
              ),
              ListTile(
                visualDensity: VisualDensity.compact,
                leading: Icon(Icons.insert_drive_file),
                title: Text("Documents"),
                onTap: () {},
              ),
              ListTile(
                visualDensity: VisualDensity.compact,
                leading: Icon(Icons.camera),
                title: Text("Scanner"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ScannerScreen()));
                },
              ),
              ListTile(
                visualDensity: VisualDensity.compact,
                leading: Icon(Icons.announcement),
                title: Text("Notifications"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationScreen()));
                },
              ),
              Divider(),
              ListTile(
                visualDensity: VisualDensity.compact,
                leading: Icon(Icons.article),
                title: Text("News"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewsScreen()));
                },
              ),
              Divider(),
              ListTile(
                visualDensity: VisualDensity.compact,
                leading: Icon(Icons.logout),
                title: Text("Log out"),
                onTap: () async {
                  Navigator.pop(context);
                  await AuthService().logOut();
                },
              ),
              ListTile(
                visualDensity: VisualDensity.compact,
                leading: Icon(Icons.person),
                title: Text("Profile"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProfileScreen(metaUser: AuthService().currentUser),
                    ),
                  );
                },
              ),
              ListTile(
                visualDensity: VisualDensity.compact,
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingsScreen()));
                },
              ),
              Divider(),
              Signature(),
            ],
          ),
        ),
        body: FutureBuilder(
          future: _getPosts(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return LoadingScreen();
            return ListView(
              children: [RemindersCard()].cast<Widget>() + snapshot.data,
            );
          },
        ));
  }

  Future<List<Widget>> _getPosts() async {
    var groups = await Database.getUserGroups(AuthService().currentUser.uid);
    List<Widget> result = [
      PostCard(
        post: PostModel(
          group: GroupModel(name: "Advanced Programming Methods"),
          title: "Somebody come look at this cool penguin we found :D",
          text: "We found this guy just idling around campus.",
          image: Image.network(
              "https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg"),
          datePosted: DateTime.now(),
          op: UserModel(
            name: "Darius",
            surname: "Calugar",
            photo: Image.network(
                "https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg"),
          ),
        ),
      ),
    ];
    for (var group in groups) {
      var groupPosts = await Database.getGroupPosts(group);
      for (var post in groupPosts) {
        result += [
          PostCard(
            post: post,
          )
        ];
      }
    }
    return result;
  }
}
