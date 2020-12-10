import 'package:flutter/material.dart';
import 'package:student_toolbox/widgets/profile/profile_preview.dart';
import 'package:student_toolbox/widgets/search_bar.dart';

class FriendSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Group"),
        leading: FlatButton(
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SearchBar(),
            Divider(),
            Expanded(
              child: ListView(
                children: []
                    .map((e) => ProfilePreview(user: e, navigateOnPress: true))
                    .cast<Widget>()
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
