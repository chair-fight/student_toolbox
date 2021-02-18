import 'package:flutter/material.dart';
import 'package:student_toolbox/widgets/app_bars/common_app_bar.dart';

class GroupListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: Text("Groups"),
      ),
    );
  }
}
