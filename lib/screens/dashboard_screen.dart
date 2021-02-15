import 'package:flutter/material.dart';
import 'package:student_toolbox/widgets/app_bars/common_app_bar.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Text("Dashboard"),
      ),
      body: ListView(
        children: [
          //PostFeed(),
        ],
      ),
    );
  }
}
