import 'package:flutter/material.dart';
import 'package:student_toolbox/screens/schedule_screen/class_edit_screen.dart';
import 'package:student_toolbox/widgets/screen_app_bar.dart';

class ScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: ScreenAppBar(
          title: "Schedule",
          subScreen: true,
          tabBar: TabBar(
            tabs: [
              Container(
                height: 40,
                child: Tab(
                  text: "Week 1",
                ),
              ),
              Container(
                height: 40,
                child: Tab(
                  text: "Week 2",
                ),
              ),
            ],
          ),
        ).get(context),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          splashColor: Theme.of(context).colorScheme.secondary,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ClassEditScreen()));
          },
        ),
      ),
    );
  }
}
