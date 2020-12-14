import 'package:flutter/material.dart';
import 'package:student_toolbox/widgets/posts/post_feed.dart';
import 'package:student_toolbox/widgets/reminders/reminder_list.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ReminderList(),
          Divider(),
          PostFeed(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.send),
        onPressed: () {},
      ),
    );
  }
}
