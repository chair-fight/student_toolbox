import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:student_toolbox/art/gradients/primary_gradient.dart';

class SimpleAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget title;
  final PreferredSizeWidget bottom;

  const SimpleAppBar({Key key, this.title, this.bottom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      leading: FlatButton(
        child: Icon(
          FontAwesomeIcons.arrowLeft,
          color: Theme.of(context).primaryIconTheme.color,
        ),
        onPressed: () {
          Navigator.maybePop(context);
        },
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(gradient: PrimaryGradient.build(context)),
      ),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize + Offset(0, bottom == null ? 0 : bottom.preferredSize.height);
}
