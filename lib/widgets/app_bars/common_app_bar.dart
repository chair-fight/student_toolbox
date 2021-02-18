import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:student_toolbox/art/gradients/primary_gradient.dart';
import 'package:student_toolbox/screens/profile_screen.dart';
import 'package:student_toolbox/screens/settings_screen.dart';

class CommonAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget title;
  final PreferredSizeWidget bottom;

  const CommonAppBar({Key key, this.title, this.bottom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      leading: FlatButton(
        padding: EdgeInsets.zero,
        shape: CircleBorder(),
        child: Container(
          width: 32,
          height: 32,
          child: ClipOval(
            child: FittedBox(
              fit: BoxFit.cover,
              child: Icon(
                FontAwesomeIcons.user,
                color: Theme.of(context).primaryIconTheme.color,
              ),
            ),
          ),
        ),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen())),
      ),
      actions: [
        IconButton(
          icon: Icon(FontAwesomeIcons.cog),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen())),
        )
      ],
      flexibleSpace: Container(
        decoration: BoxDecoration(gradient: PrimaryGradient.build(context)),
      ),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize + Offset(0, bottom == null ? 0 : bottom.preferredSize.height);
}
