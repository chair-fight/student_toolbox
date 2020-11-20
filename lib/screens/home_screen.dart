import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/screens/assignment_list_screen.dart';
import 'package:student_toolbox/screens/group_list_screen.dart';
import 'package:student_toolbox/screens/news_screen.dart';
import 'package:student_toolbox/screens/profile_screen.dart';
import 'package:student_toolbox/screens/scanner_screen.dart';
import 'package:student_toolbox/screens/settings_screen.dart';
import 'package:student_toolbox/widgets/screen_app_bar.dart';
import 'package:student_toolbox/widgets/signature.dart';

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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AssignmentListScreen()));
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
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
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
    );
  }
}
