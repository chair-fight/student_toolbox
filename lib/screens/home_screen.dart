import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:student_toolbox/screens/assignment_list_screen.dart';
import 'package:student_toolbox/screens/dashboard_screen.dart';
import 'package:student_toolbox/screens/group_list_screen.dart';
import 'package:student_toolbox/screens/schedule_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Builder> navigatorBarBuilders = [
    Builder(builder: (BuildContext context) => AssignmentListScreen()),
    Builder(builder: (BuildContext context) => ScheduleScreen()),
    Builder(builder: (BuildContext context) => DashboardScreen()),
    Builder(builder: (BuildContext context) => GroupListScreen()),
    Builder(builder: (BuildContext context) => DashboardScreen()),
  ];

  int _pageIndex = 2;
  Widget _currentScreen = DashboardScreen();

  void _setPage(int index) {
    setState(() {
      _pageIndex = index;
      _currentScreen = navigatorBarBuilders[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _pageIndex,
        onTap: _setPage,
        items: [
          BottomNavigationBarItem(
            label: "Assignments",
            icon: Icon(
              FontAwesomeIcons.tasks,
              size: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: "Schedule",
            icon: Icon(
              FontAwesomeIcons.solidCalendarAlt,
              size: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              FontAwesomeIcons.home,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            label: "Groups",
            icon: Icon(
              FontAwesomeIcons.users,
              size: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: "Files",
            icon: Icon(
              FontAwesomeIcons.solidFileAlt,
              size: 24,
            ),
          ),
        ],
      ),
      body: _currentScreen,
    );
  }
}
