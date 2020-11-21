import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/models/user_model.dart';
import 'package:student_toolbox/screens/friend_list_screen/friend_search_screen.dart';
import 'package:student_toolbox/widgets/profile_preview.dart';
import 'package:student_toolbox/widgets/screen_app_bar.dart';
import 'package:student_toolbox/widgets/search_bar.dart';
import 'package:student_toolbox/widgets/surface.dart';

class FriendListScreen extends StatelessWidget {
  static List<UserModel> friends = [
    UserModel(
      name: "Andrei-Mihai",
      surname: "Petrus",
      email: "makerVD@gmail.com",
      university: "Babes Bolyiai University",
      photo: Image.network(
          "https://scontent-otp1-1.xx.fbcdn.net/v/t1.0-9/30265304_1455239354580770_7292831155525517312_o.jpg?_nc_cat=105&ccb=2&_nc_sid=09cbfe&_nc_ohc=iqPxxgu2CKwAX83pYdc&_nc_ht=scontent-otp1-1.xx&oh=1209c7c38e6b2fe360f608a8ed402b26&oe=5FDDE0A3"),
      gender: "Male",
      dateOfBirth: DateTime(2000, 11, 13),
    ),
    UserModel(
      name: "Andrew",
      surname: "Barzu",
      email: "darius_calugar@yahoo.com",
      university: "Babes Bolyiai University",
      photo: Image.network(
          "https://scontent-otp1-1.xx.fbcdn.net/v/t1.0-9/123544564_3423002091147698_7323482164259209220_n.jpg?_nc_cat=101&ccb=2&_nc_sid=09cbfe&_nc_ohc=MJkzSxrPkREAX-lwBOf&_nc_ht=scontent-otp1-1.xx&oh=0244a2472cb21d42668887c01a1920ca&oe=5FDD3B9A"),
      gender: "Male",
      dateOfBirth: DateTime(2000, 11, 13),
    ),
    UserModel(
      name: "Paul",
      surname: "Bumbu",
      email: "darius_calugar@yahoo.com",
      university: "Babes Bolyiai University",
      photo: Image.network(
          "https://scontent-otp1-1.xx.fbcdn.net/v/t1.0-9/68386678_2437600246471325_7306126076466429952_n.jpg?_nc_cat=101&ccb=2&_nc_sid=09cbfe&_nc_ohc=PEhNgPT3hEMAX_qSwHk&_nc_ht=scontent-otp1-1.xx&oh=c909a22bb44686efabe0051a92e7d2d0&oe=5FDF204E"),
      gender: "Male",
      dateOfBirth: DateTime(2000, 11, 13),
    ),
    UserModel(
      name: "Catalin",
      surname: "Borza",
      email: "darius_calugar@yahoo.com",
      university: "Babes Bolyiai University",
      photo: Image.network(
          "https://scontent-otp1-1.xx.fbcdn.net/v/t1.0-9/47345716_728857560846780_4613486447243034624_o.jpg?_nc_cat=107&ccb=2&_nc_sid=09cbfe&_nc_ohc=DOjLxKySdVAAX-Z_YbP&_nc_ht=scontent-otp1-1.xx&oh=bae77c32587140528523c3e3185da681&oe=5FDE195F"),
      gender: "Male",
      dateOfBirth: DateTime(2000, 11, 13),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: "Friends",
        subScreen: true,
      ).get(context),
      body: Container(
        child: Column(
          children: [
            SearchBar(),
            Divider(),
            Expanded(
              child: ListView(
                children: friends
                    .map((e) => ProfilePreview(
                          user: e,
                          navigateOnPress: true,
                          isDense: true,
                        ))
                    .cast<Widget>()
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        splashColor: Theme.of(context).colorScheme.secondary,
        child: Icon(Icons.person_add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FriendSearchScreen()));
        },
      ),
    );
  }
}
