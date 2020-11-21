import 'package:flutter/material.dart';
import 'package:student_toolbox/widgets/button_primary.dart';
import 'package:student_toolbox/widgets/screen_app_bar.dart';
import 'package:student_toolbox/widgets/surface.dart';

class ScannerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenAppBar(
        title: "Scanner",
        subScreen: true,
      ).get(context),
      body: Surface(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            child: Image.network(
              "https://int.nyt.com/data/documenttools/27e6e12d458891dc/1/output-1.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "27e6e12d458891dc0output-1.png",
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: ButtonPrimary(
                    label: "Gallery",
                    width: 100,
                    onPressed: () {},
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: ButtonPrimary(
                    label: "New",
                    width: 100,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 32),
            child: ButtonPrimary(
              width: 200,
              label: "Scan",
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
