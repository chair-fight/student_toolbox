import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/models/group_model.dart';
import 'package:student_toolbox/models/post_model.dart';
import 'package:student_toolbox/models/user_model.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/widgets/column_divider.dart';
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
                ),
                Surface(
                  title: "Description",
                  children: [Text(group.description)],
                ),
                ColumnDivider(
                  label: "Members",
                ),
                ProfilePreview(
                  user: UserModel(
                    name: "Darius",
                    surname: "Calugar",
                    email: "darius_calugar@yahoo.com",
                    university: "Babes Bolyiai University",
                    photo: Image.network(
                        "https://scontent-otp1-1.xx.fbcdn.net/v/t1.0-9/58377221_2417367858308020_8272458563759112192_n.jpg?_nc_cat=105&ccb=2&_nc_sid=09cbfe&_nc_ohc=V1ay19wnI3kAX8QVwwN&_nc_oc=AQll_5l-MWPnCQMIh79C6cCOIJMR9aRrFgQ-ao4patxdM0QWQtl2JNuUvg4ZoEe-i6k&_nc_ht=scontent-otp1-1.xx&oh=7c12f0f6ba25051045168af0a69dccfe&oe=5FDF2FD8"),
                    gender: "Male",
                    metaUser: AuthService().currentUser,
                    dateOfBirth: DateTime(2000, 11, 13),
                  ),
                  navigateOnPress: true,
                  isDense: true,
                ),
                ProfilePreview(
                  user: UserModel(
                    name: "Andrei-Mihai",
                    surname: "Petrus",
                    email: "makerVD@gmail.com",
                    university: "Babes Bolyiai University",
                    photo: Image.network(
                        "https://scontent-otp1-1.xx.fbcdn.net/v/t1.0-9/30265304_1455239354580770_7292831155525517312_o.jpg?_nc_cat=105&ccb=2&_nc_sid=09cbfe&_nc_ohc=iqPxxgu2CKwAX83pYdc&_nc_ht=scontent-otp1-1.xx&oh=1209c7c38e6b2fe360f608a8ed402b26&oe=5FDDE0A3"),
                    gender: "Male",
                    metaUser: AuthService().currentUser,
                    dateOfBirth: DateTime(2000, 11, 13),
                  ),
                  navigateOnPress: true,
                  isDense: true,
                ),
                ProfilePreview(
                  user: UserModel(
                    name: "Andrew",
                    surname: "Barzu",
                    email: "darius_calugar@yahoo.com",
                    university: "Babes Bolyiai University",
                    photo: Image.network(
                        "https://scontent-otp1-1.xx.fbcdn.net/v/t1.0-9/123544564_3423002091147698_7323482164259209220_n.jpg?_nc_cat=101&ccb=2&_nc_sid=09cbfe&_nc_ohc=MJkzSxrPkREAX-lwBOf&_nc_ht=scontent-otp1-1.xx&oh=0244a2472cb21d42668887c01a1920ca&oe=5FDD3B9A"),
                    gender: "Male",
                    metaUser: AuthService().currentUser,
                    dateOfBirth: DateTime(2000, 11, 13),
                  ),
                  navigateOnPress: true,
                  isDense: true,
                ),
                ProfilePreview(
                  user: UserModel(
                    name: "Paul",
                    surname: "Bumbu",
                    email: "darius_calugar@yahoo.com",
                    university: "Babes Bolyiai University",
                    photo: Image.network(
                        "https://scontent-otp1-1.xx.fbcdn.net/v/t1.0-9/68386678_2437600246471325_7306126076466429952_n.jpg?_nc_cat=101&ccb=2&_nc_sid=09cbfe&_nc_ohc=PEhNgPT3hEMAX_qSwHk&_nc_ht=scontent-otp1-1.xx&oh=c909a22bb44686efabe0051a92e7d2d0&oe=5FDF204E"),
                    gender: "Male",
                    metaUser: AuthService().currentUser,
                    dateOfBirth: DateTime(2000, 11, 13),
                  ),
                  navigateOnPress: true,
                  isDense: true,
                ),
                ProfilePreview(
                  user: UserModel(
                    name: "Catalin",
                    surname: "Borza",
                    email: "darius_calugar@yahoo.com",
                    university: "Babes Bolyiai University",
                    photo: Image.network(
                        "https://scontent-otp1-1.xx.fbcdn.net/v/t1.0-9/47345716_728857560846780_4613486447243034624_o.jpg?_nc_cat=107&ccb=2&_nc_sid=09cbfe&_nc_ohc=DOjLxKySdVAAX-Z_YbP&_nc_ht=scontent-otp1-1.xx&oh=bae77c32587140528523c3e3185da681&oe=5FDE195F"),
                    gender: "Male",
                    metaUser: AuthService().currentUser,
                    dateOfBirth: DateTime(2000, 11, 13),
                  ),
                  navigateOnPress: true,
                  isDense: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
