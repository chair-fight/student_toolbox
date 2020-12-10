import 'package:flutter/material.dart';
import 'package:student_toolbox/placeholders/placeholder_images.dart';
import 'package:student_toolbox/screens/about_us_screen.dart';
import 'package:student_toolbox/screens/assignments_screen/assignment_screen.dart';
import 'package:student_toolbox/screens/dashboard_screen.dart';
import 'package:student_toolbox/screens/document_list_screen.dart';
import 'package:student_toolbox/screens/group_screen/group_list_page.dart';
import 'package:student_toolbox/screens/home_screen/profile_page.dart';
import 'package:student_toolbox/screens/schedule_screen/schedule_screen.dart';
import 'package:student_toolbox/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> contextMenuChoices = [
    "Settings",
    "About us",
  ];
  List<Builder> contextMenuBuilders = [
    Builder(builder: (BuildContext context) => SettingsScreen()),
    Builder(builder: (BuildContext context) => AboutUsScreen()),
  ];

  List<String> navigatorBarChoices = [
    "Assignments",
    "Schedule",
    "Dashboard",
    "Groups",
    "Documents",
  ];
  List<Builder> navigatorBarBuilders = [
    Builder(builder: (BuildContext context) => AssignmentScreen()),
    Builder(builder: (BuildContext context) => ScheduleScreen()),
    Builder(builder: (BuildContext context) => DashboardScreen()),
    Builder(builder: (BuildContext context) => GroupListPage()),
    Builder(builder: (BuildContext context) => DocumentListScreen()),
  ];

  int _pageIndex = 2;
  Widget _currentScreen = DashboardScreen();
  String _currentPageName = "Dashboard";

  void _setPage(int index) {
    setState(() {
      _pageIndex = index;
      _currentPageName = navigatorBarChoices[index];
      _currentScreen = navigatorBarBuilders[index];
    });
  }

  void _selectFromMenu(String choice) {
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: contextMenuBuilders[contextMenuChoices.indexOf(choice)]
                  .builder));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentPageName),
        elevation: 0,
        leading: FlatButton(
          padding: EdgeInsets.zero,
          shape: CircleBorder(),
          child: Container(
            width: 32,
            height: 32,
            child: ClipOval(
              child: FittedBox(
                fit: BoxFit.cover,
                child: PlaceholderImages.image2,
              ),
            ),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
          },
        ),
        toolbarHeight: 40,
        actions: [
          PopupMenuButton(
            onSelected: _selectFromMenu,
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context) {
              return contextMenuChoices
                  .map((choice) => PopupMenuItem(
                        value: choice,
                        child: Text(choice),
                      ))
                  .toList();
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[600],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _pageIndex,
        onTap: _setPage,
        items: [
          BottomNavigationBarItem(
            label: "Tasks",
            icon: Icon(
              Icons.web_outlined,
              size: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: "Schedule",
            icon: Icon(
              Icons.calendar_today,
              size: 20,
            ),
          ),
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home, size: 40),
          ),
          BottomNavigationBarItem(
            label: "Groups",
            icon: Icon(
              Icons.group,
              size: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: "Files",
            icon: Icon(
              Icons.description,
              size: 20,
            ),
          ),
        ],
      ),
      body: _currentScreen,
    );
  }
}
