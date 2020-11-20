import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_toolbox/models/post_model.dart';
import 'package:student_toolbox/models/user_model.dart';
import 'package:student_toolbox/screens/assignment_list_screen.dart';
import 'package:student_toolbox/screens/group_list_screen.dart';
import 'package:student_toolbox/screens/news_screen.dart';
import 'package:student_toolbox/screens/profile_screen.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/screens/scanner_screen.dart';
import 'package:student_toolbox/screens/settings_screen.dart';
import 'package:student_toolbox/widgets/news_card.dart';
import 'package:student_toolbox/widgets/post_card.dart';
import 'package:student_toolbox/widgets/screen_app_bar.dart';
import 'package:student_toolbox/widgets/signature.dart';
import 'package:student_toolbox/widgets/surface.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: "Home",
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
              onTap: () {},
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              leading: Icon(Icons.account_circle),
              title: Text("Groups"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GroupListScreen()));
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
              onTap: () {},
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
                    builder: (context) => ProfileScreen(
                      user: UserModel(
                        name: "Madalina",
                        surname: "Adam",
                        email: "dariusel@mail.com",
                        photo: Image.network("https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg"),
                        university: "Babes Bolyai University",
                        gender: "Female",
                        dateOfBirth: DateTime.now(),
                        metaUser: AuthService().currentUser,
                      ),
                    ),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()));
              },
            ),
            Divider(),
            Signature(),
          ],
        ),
      ),
      body: ListView(
        children: [
          Surface(
            title: "Reminders",
            children: [],
          ),
          Divider(),
          PostCard(
            post: PostModel(
              title: "Post One",
              text: "Lorem Ipsum",
              datePosted: DateTime.now(),
            ),
          ),
          PostCard(
            post: PostModel(
              title: "Post Two",
              text: "Lorem Ipsum",
              image: Image.network(
                  "https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg"),
              datePosted: DateTime.now(),
            ),
          ),
        ],
      ),
    );
  }
}
