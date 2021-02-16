import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:student_toolbox/art/gradients/primary_gradient.dart';
import 'package:student_toolbox/widgets/app_bars/simple_app_bar.dart';
import 'package:student_toolbox/widgets/brand/logo.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        title: Text("About Us"),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            decoration: BoxDecoration(
              gradient: PrimaryGradient().build(context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset("assets/images/logo_full_monoxxxhdpi.png"),
                Container(
                  child: Text(
                    "Developed by Chair Fight",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Contact Us", style: Theme.of(context).textTheme.headline5),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: BorderDirectional(bottom: BorderSide(color: Theme.of(context).dividerColor)),
            ),
            child: Column(
              children: [
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      child: Icon(FontAwesomeIcons.googlePlay, size: 32),
                      onPressed: () {},
                    ),
                    TextButton(
                      child: Icon(FontAwesomeIcons.facebookF, size: 32),
                      onPressed: () {},
                    ),
                    TextButton(
                      child: Icon(FontAwesomeIcons.twitter, size: 32),
                      onPressed: () {},
                    ),
                    TextButton(
                      child: Icon(FontAwesomeIcons.linkedinIn, size: 32),
                      onPressed: () {},
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.subtitle1,
                      children: [
                        TextSpan(text: "Or email us at "),
                        TextSpan(
                          text: "support.chairfight@gmail.com",
                          style: TextStyle(color: Theme.of(context).colorScheme.secondary, decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Developers", style: Theme.of(context).textTheme.headline5),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: BorderDirectional(bottom: BorderSide(color: Theme.of(context).dividerColor)),
            ),
            child: Column(
              children: [
                _DevWidget(
                  devName: "Cătălin Borza",
                  devRoles: ["Mobile Developer"],
                  contactLink: "",
                ),
                _DevWidget(
                  devName: "Andrei Petruș",
                  devRoles: ["Database Manager", "Web Developer"],
                  contactLink: "",
                ),
                _DevWidget(
                  devName: "Darius Călugăr",
                  devRoles: ["Mobile Developer", "UX Designer"],
                  contactLink: "sites.google.com/view/darius-calugar/home",
                ),
                _DevWidget(
                  devName: "Andrei Barzu",
                  devRoles: ["Database Manager"],
                  contactLink: "",
                ),
                _DevWidget(
                  devName: "Alex Conțu",
                  devRoles: ["Software Tester"],
                  contactLink: "",
                ),
                _DevWidget(
                  devName: "Paul Bumbu",
                  devRoles: ["General Help"],
                  contactLink: "",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DevWidget extends StatelessWidget {
  final String devName;
  final List<String> devRoles;
  final String contactLink;

  const _DevWidget({Key key, this.devName, this.devRoles = const [], this.contactLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Row(
        children: [
          Icon(FontAwesomeIcons.user),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  devName,
                  style: Theme.of(context).textTheme.headline6,
                ),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.caption,
                    children: devRoles.map((e) => TextSpan(text: e)).fold(
                      [
                        WidgetSpan(
                          alignment: PlaceholderAlignment.baseline,
                          baseline: TextBaseline.alphabetic,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Icon(
                              FontAwesomeIcons.plus,
                              size: 8,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                      (previousValue, element) => previousValue //
                        ..add(element)
                        ..add(
                          WidgetSpan(
                            alignment: PlaceholderAlignment.baseline,
                            baseline: TextBaseline.alphabetic,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                size: 8,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          OutlinedButton(
            child: Row(
              children: [
                Text("Contact"),
              ],
            ),
            onPressed: contactLink == null ? null : () {},
          )
        ],
      ),
    );
  }
}
