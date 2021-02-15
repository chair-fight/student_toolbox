import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColumnDivider extends StatelessWidget {
  final String label;
  final Widget leading;
  final Widget trailing;

  const ColumnDivider({Key key, this.label, this.leading, this.trailing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Container(height: 1, color: Theme.of(context).dividerColor),
          ),
          (leading == null)
              ? Container()
              : Container(
                  padding: EdgeInsets.only(left: 8),
                  child: leading,
                ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              label,
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          (trailing == null)
              ? Container()
              : Container(
                  padding: EdgeInsets.only(right: 8),
                  child: trailing,
                ),
          Expanded(
            child: Container(height: 1, color: Theme.of(context).dividerColor),
          ),
        ],
      ),
    );
  }
}
