import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:student_toolbox/screens/about_us_screen.dart';
import 'package:student_toolbox/services/auth.dart';
import 'package:student_toolbox/services/theme_switcher.dart';
import 'package:student_toolbox/widgets/app_bars/simple_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        title: Text("Settings"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Profile", style: Theme.of(context).textTheme.headline6),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: BorderDirectional(bottom: BorderSide(color: Theme.of(context).dividerColor)),
            ),
            child: Column(
              children: [
                _SettingsButton(
                  icon: FontAwesomeIcons.userEdit,
                  label: "Edit Profile",
                  buttonRole: _SettingsButtonRole.Button,
                  onTap: () {},
                ),
                _SettingsButton(
                  icon: FontAwesomeIcons.signOutAlt,
                  label: "Log Out",
                  buttonRole: _SettingsButtonRole.Button,
                  onTap: () => AuthService().logOut(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Accessibility", style: Theme.of(context).textTheme.headline6),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: BorderDirectional(bottom: BorderSide(color: Theme.of(context).dividerColor)),
            ),
            child: Column(
              children: [
                _SettingsButton(
                  icon: FontAwesomeIcons.solidMoon,
                  label: "Night Mode",
                  buttonRole: _SettingsButtonRole.Switch,
                  onChanged: (bool value) => themeSwitcher.switchTheme(),
                  value: themeSwitcher.isDark,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Notifications", style: Theme.of(context).textTheme.headline6),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: BorderDirectional(bottom: BorderSide(color: Theme.of(context).dividerColor)),
            ),
            child: Column(
              children: [
                _SettingsButton(
                  icon: FontAwesomeIcons.tasks,
                  label: "Assignment Reminders",
                  buttonRole: _SettingsButtonRole.Switch,
                  onChanged: (bool value) => {},
                  value: false,
                ),
                _SettingsButton(
                  icon: FontAwesomeIcons.solidCalendarAlt,
                  label: "Exam Reminders",
                  buttonRole: _SettingsButtonRole.Switch,
                  onChanged: (bool value) => {},
                  value: false,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Application", style: Theme.of(context).textTheme.headline6),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: BorderDirectional(bottom: BorderSide(color: Theme.of(context).dividerColor)),
            ),
            child: Column(
              children: [
                _SettingsButton(
                  icon: FontAwesomeIcons.infoCircle,
                  label: "About Us",
                  buttonRole: _SettingsButtonRole.Goto,
                  pageRoute: MaterialPageRoute(builder: (context) => AboutUsScreen()),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

enum _SettingsButtonRole {
  Button,
  Goto,
  Switch,
}

class _SettingsButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final _SettingsButtonRole buttonRole;
  final Function onTap;
  final Function(bool) onChanged;
  final bool value;
  final MaterialPageRoute pageRoute;

  const _SettingsButton({
    Key key,
    this.icon,
    this.label,
    this.buttonRole,
    this.onTap,
    this.onChanged,
    this.value,
    this.pageRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      child: InkWell(
        child: Container(
          height: 56,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(icon, size: 32),
              SizedBox(width: 16),
              Expanded(child: Text(label, style: Theme.of(context).textTheme.subtitle1)),
              if (buttonRole == _SettingsButtonRole.Goto)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(FontAwesomeIcons.ellipsisH, size: 24, color: Colors.white12),
                ),
              if (buttonRole == _SettingsButtonRole.Switch)
                Switch(
                  onChanged: onChanged,
                  value: value,
                ),
            ],
          ),
        ),
        onTap: buttonRole != _SettingsButtonRole.Switch //
            ? () => buttonRole != _SettingsButtonRole.Button //
                ? Navigator.push(context, pageRoute)
                : onTap()
            : null,
      ),
    );
  }
}
