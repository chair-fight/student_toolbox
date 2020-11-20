import 'package:flutter/material.dart';
import 'package:student_toolbox/widgets/news_card.dart';
import 'package:student_toolbox/widgets/screen_app_bar.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: "News",
        subScreen: true,
      ).get(context),
      body: ListView(
        children: [
          NewsCard(
            title: "Welcome to StudBox",
            image: Image.network(
                "https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg"),
            text:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin et vehicula ligula. Fusce sed pellentesque odio, vel eleifend nibh. Suspendisse vitae convallis arcu. Morbi id orci at tellus sodales sagittis. Curabitur tempor convallis tincidunt. Etiam quis congue libero. Aliquam efficitur massa id vulputate ultrices."
                  "Vestibulum sagittis ante est, a gravida lacus convallis sed. Morbi placerat ex bibendum, sodales enim vitae, ornare mauris. Duis vitae lorem ut nibh tristique condimentum. Phasellus vulputate ligula vitae lorem interdum, quis rhoncus dolor ultrices. Proin fringilla urna ex, nec ultrices quam imperdiet non. Ut cursus eros ante, in sodales lorem ultrices ac. Maecenas eget pellentesque odio. Sed pretium id erat ut mattis. Ut arcu arcu, convallis sit amet interdum eu, rutrum eget urna.",
          ),
        ],
      ),
    );
  }
}
