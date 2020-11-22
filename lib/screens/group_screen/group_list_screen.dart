import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:student_toolbox/models/group_model.dart';
import 'package:student_toolbox/screens/group_screen/group_create_screen.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/services/database.dart';
import 'package:student_toolbox/widgets/button_primary.dart';
import 'package:student_toolbox/widgets/group_preview.dart';
import 'package:student_toolbox/widgets/screen_app_bar.dart';
import 'package:student_toolbox/widgets/search_bar.dart';

class GroupListScreen extends StatefulWidget {
  @override
  _GroupListScreenState createState() => _GroupListScreenState();
}

class _GroupListScreenState extends State<GroupListScreen> {
  String _searchString = "";

  void _navigateToGroupCreation() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => GroupCreateScreen()));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: "Groups",
        subScreen: true,
      ).get(context),
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
            Expanded(
                child: FutureBuilder(
              future: Database.getUserGroups(AuthService().currentUser.uid),
              builder: (BuildContext context,
                  AsyncSnapshot<List<GroupModel>> buffer) {
                return ListView(
                  children: (buffer.connectionState == ConnectionState.done)
                      ? (buffer.data
                          .where((GroupModel data) => data.name
                              .toUpperCase()
                              .contains(_searchString.toUpperCase()))
                          .map((data) => GroupPreview(
                                group: data,
                                navigateOnPress: true,
                                isDense: true,
                                showDescription: true,
                              ))
                          .toList())
                      : [
                          SpinKitWave(
                            color: Theme.of(context).colorScheme.primary,
                          )
                        ],
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
