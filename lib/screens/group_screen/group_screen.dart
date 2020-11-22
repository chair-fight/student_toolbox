import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:student_toolbox/models/group_model.dart';
import 'package:student_toolbox/models/post_model.dart';
import 'package:student_toolbox/models/user_model.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/services/database.dart';
import 'package:student_toolbox/widgets/column_divider.dart';
import 'package:student_toolbox/widgets/dialogs/delete_group_dialog.dart';
import 'package:student_toolbox/widgets/group_preview.dart';
import 'package:student_toolbox/widgets/post_card.dart';
import 'package:student_toolbox/widgets/profile_preview.dart';
import 'package:student_toolbox/widgets/screen_app_bar.dart';
import 'package:student_toolbox/widgets/surface.dart';

class GroupScreen extends StatelessWidget {
  final GroupModel group;

  const GroupScreen({Key key, this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: ScreenAppBar(
            title: "Group",
            subScreen: true,
            tabBar: TabBar(
              tabs: [
                Container(
                  height: 40,
                  child: Tab(
                    icon: Icon(Icons.image),
                  ),
                ),
                Container(
                  padding: EdgeInsets.zero,
                  height: 40,
                  width: 20,
                  child: Tab(
                    icon: Icon(Icons.info),
                  ),
                ),
              ],
            )).get(context),
        body: TabBarView(
          children: [
            ListView(
              children: [],
            ),
            ListView(
              children: [
                GroupPreview(
                  group: group,
                  showDescription: false,
                  isDense: false,
                  navigateOnPress: false,
                ),
                Surface(
                  title: "Description",
                  children: [
                    Container(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(group.description),
                    ),
                  ],
                ),
                FutureBuilder(
                  future: Database.checkUserGroupAdmin(
                      AuthService().currentUser.uid, group.id),
                  builder: (BuildContext context, AsyncSnapshot<bool> buffer) {
                    return buffer.connectionState == ConnectionState.done
                        ? Column(children: [
                            Surface(title: "Admin Powers", children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: RaisedButton(
                                      color: Colors.red[800],
                                      child: Text(
                                        "Delete Group",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () => showDialog(
                                          context: context,
                                          builder: (_) =>
                                              DeleteGroupDialog(group: group)),
                                    ),
                                  ),
                                ],
                              ),
                            ])
                          ])
                        : Container();
                  },
                ),
                ColumnDivider(
                  label: "Members",
                ),
                FutureBuilder(
                  future: Database.getGroupMembers(group.id),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<UserModel>> buffer) {
                    return buffer.connectionState == ConnectionState.done
                        ? Column(
                            children: buffer.data
                                .map((e) => ProfilePreview(
                                      user: e,
                                      navigateOnPress: true,
                                      isDense: true,
                                    ))
                                .toList(),
                          )
                        : SpinKitWave(
                            color: Theme.of(context).colorScheme.primary,
                          );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
