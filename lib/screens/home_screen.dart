import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/screens/profile_screen.dart';
import 'package:student_toolbox/screens/settings_sceen.dart';
import 'package:student_toolbox/widgets/signature.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: Drawer(
        elevation: 0,
        child: ListView(
          children: [
            DrawerHeader(
              child: FlutterLogo(),
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              leading: Icon(Icons.backup_table),
              title: Text("Classes"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              leading: Icon(Icons.account_circle),
              title: Text("Groups"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              leading: Icon(Icons.insert_drive_file),
              title: Text("Documents"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              leading: Icon(Icons.camera),
              title: Text("Scanner"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              visualDensity: VisualDensity.compact,
              leading: Icon(Icons.article),
              title: Text("News"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              leading: Icon(Icons.bar_chart),
              title: Text("Statistics"),
              onTap: () {
                Navigator.pop(context);
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),
            ListTile(
              visualDensity: VisualDensity.compact,
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
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
