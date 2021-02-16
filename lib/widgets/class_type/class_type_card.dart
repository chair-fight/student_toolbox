import 'package:flutter/material.dart';
import 'package:student_toolbox/models/activity_label_model.dart';

class ActivityTypeCard extends StatelessWidget {
  final ActivityLabelModel activityLabelModel;
  final Function onTap;

  const ActivityTypeCard({
    Key key,
    @required this.activityLabelModel,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8, right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Material(
          color: activityLabelModel.color,
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.bookmark, size: 16),
                  Text(activityLabelModel.string),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
