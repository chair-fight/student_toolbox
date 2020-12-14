import 'package:flutter/material.dart';
import 'package:student_toolbox/models/group_model.dart';
import 'package:student_toolbox/screens/group_screen/group_create_screen.dart';
import 'package:student_toolbox/widgets/group/group_preview.dart';
import 'package:student_toolbox/widgets/search_bar.dart';

class GroupListPage extends StatefulWidget {
  @override
  _GroupListPageState createState() => _GroupListPageState();
}

class _GroupListPageState extends State<GroupListPage> {
  String _searchString = "";
  List<GroupModel> data = [
    GroupModel.placeholder,
    GroupModel.placeholder,
    GroupModel.placeholder,
    GroupModel.placeholder,
    GroupModel.placeholder,
    GroupModel.placeholder,
    GroupModel.placeholder,
  ];

  void _navigateToGroupCreation() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => GroupCreateScreen()));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        splashColor: Theme.of(context).colorScheme.secondary,
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary),
        onPressed: () {
          _navigateToGroupCreation();
        },
      ),
      body: Container(
        child: Column(
          children: [
            SearchBar(
              onSearch: (value) => setState(() {
                _searchString = value;
              }),
              onCancel: () => setState(() {
                _searchString = "";
              }),
            ),
            Divider(),
            Column(
              children: data
                  .map((groupModel) => GroupPreview(group: groupModel))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
