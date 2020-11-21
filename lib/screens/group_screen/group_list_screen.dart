import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:student_toolbox/models/group_model.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/services/database.dart';
import 'package:student_toolbox/widgets/button_primary.dart';
import 'package:student_toolbox/widgets/group_preview.dart';
import 'package:student_toolbox/widgets/screen_app_bar.dart';
import 'package:student_toolbox/widgets/search_bar.dart';

class GroupListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: "Groups",
        subScreen: true,
      ).get(context),
      body: Container(
        child: Column(
          children: [
            SearchBar(),
            Container(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonPrimary(
                    label: "Create",
                    leading: Icons.add,
                    width: 128,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Divider(),
            Expanded(
                child: FutureBuilder(
              future: Database.getUserGroups(AuthService().currentUser.uid),
              builder: (BuildContext context,
                  AsyncSnapshot<List<GroupModel>> buffer) {
                return ListView(
                  children: (buffer.connectionState == ConnectionState.waiting)
                      ? [
                          SpinKitWave(
                            color: Theme.of(context).colorScheme.primary,
                          )
                        ]
                      : buffer.data
                          .map((data) => GroupPreview(
                                group: data,
                                navigateOnPress: true,
                                isDense: true,
                                showDescription: true,
                              ))
                          .toList(),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
