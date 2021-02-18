import 'package:flutter/material.dart';
import 'package:student_toolbox/widgets/app_bars/simple_app_bar.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navigator.of(context).canPop() ? SimpleAppBar() : null,
      body: Center(
        child: Text(
          "Something went wrong :(",
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
