import 'package:flutter/material.dart';
import 'package:student_toolbox/models/group_model.dart';
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
                  ButtonPrimary(
                    label: "Join",
                    leading: Icons.group,
                    width: 128,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Divider(),
            Expanded(
              child: ListView(
                children: [
                  GroupPreview(
                    group: GroupModel(
                      name: "Advanced Programming Methods",
                      description:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi volutpat mattis enim, et feugiat massa malesuada ac. Donec ut maximus odio. Sed congue gravida sodales. Suspendisse imperdiet massa vitae mi feugiat venenatis. Aliquam posuere purus vel dolor vehicula, eget sodales massa varius. Nulla gravida nibh ipsum, nec consectetur nulla sodales non. Morbi in magna metus. Duis et lorem eget felis bibendum mollis. Vivamus sollicitudin eget leo vitae varius. Suspendisse vitae lacus venenatis, facilisis turpis nec, dignissim diam. Phasellus quis turpis quis odio facilisis fermentum ut nec turpis. Nunc sollicitudin augue quis libero semper efficitur. Cras volutpat interdum lacus, vitae vehicula arcu gravida vitae. Nunc ac elit hendrerit nisi dignissim accumsan. Sed nec ex enim. Ut auctor massa turpis.",
                    ),
                    navigateOnPress: true,
                  ),
                  GroupPreview(
                    group: GroupModel(
                      name: "Databases",
                      description:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi volutpat mattis enim, et feugiat massa malesuada ac. Donec ut maximus odio. Sed congue gravida sodales. Suspendisse imperdiet massa vitae mi feugiat venenatis. Aliquam posuere purus vel dolor vehicula, eget sodales massa varius. Nulla gravida nibh ipsum, nec consectetur nulla sodales non. Morbi in magna metus. Duis et lorem eget felis bibendum mollis. Vivamus sollicitudin eget leo vitae varius. Suspendisse vitae lacus venenatis, facilisis turpis nec, dignissim diam. Phasellus quis turpis quis odio facilisis fermentum ut nec turpis. Nunc sollicitudin augue quis libero semper efficitur. Cras volutpat interdum lacus, vitae vehicula arcu gravida vitae. Nunc ac elit hendrerit nisi dignissim accumsan. Sed nec ex enim. Ut auctor massa turpis.",
                    ),
                    navigateOnPress: true,
                  ),
                  GroupPreview(
                    group: GroupModel(
                      name: "Analysis",
                      description:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi volutpat mattis enim, et feugiat massa malesuada ac. Donec ut maximus odio. Sed congue gravida sodales. Suspendisse imperdiet massa vitae mi feugiat venenatis. Aliquam posuere purus vel dolor vehicula, eget sodales massa varius. Nulla gravida nibh ipsum, nec consectetur nulla sodales non. Morbi in magna metus. Duis et lorem eget felis bibendum mollis. Vivamus sollicitudin eget leo vitae varius. Suspendisse vitae lacus venenatis, facilisis turpis nec, dignissim diam. Phasellus quis turpis quis odio facilisis fermentum ut nec turpis. Nunc sollicitudin augue quis libero semper efficitur. Cras volutpat interdum lacus, vitae vehicula arcu gravida vitae. Nunc ac elit hendrerit nisi dignissim accumsan. Sed nec ex enim. Ut auctor massa turpis.",

                    ),
                    navigateOnPress: true,
                  ),
                  GroupPreview(
                    group: GroupModel(
                      name: "Robotics & Engineering",
                      description:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi volutpat mattis enim, et feugiat massa malesuada ac. Donec ut maximus odio. Sed congue gravida sodales. Suspendisse imperdiet massa vitae mi feugiat venenatis. Aliquam posuere purus vel dolor vehicula, eget sodales massa varius. Nulla gravida nibh ipsum, nec consectetur nulla sodales non. Morbi in magna metus. Duis et lorem eget felis bibendum mollis. Vivamus sollicitudin eget leo vitae varius. Suspendisse vitae lacus venenatis, facilisis turpis nec, dignissim diam. Phasellus quis turpis quis odio facilisis fermentum ut nec turpis. Nunc sollicitudin augue quis libero semper efficitur. Cras volutpat interdum lacus, vitae vehicula arcu gravida vitae. Nunc ac elit hendrerit nisi dignissim accumsan. Sed nec ex enim. Ut auctor massa turpis.",
                    ),
                    navigateOnPress: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
