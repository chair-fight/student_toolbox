import 'package:flutter/material.dart';
import 'package:student_toolbox/widgets/surface.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 4),
      color: Theme.of(context).colorScheme.surface,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(7),
                isDense: true,
                hintText: "Search...",
              ),
            ),
          ),
          Container(
            width: 64,
            child: FlatButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.zero,
              splashColor: Theme.of(context).colorScheme.secondary,
              child: Container(
                  child: Icon(Icons.search)),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
