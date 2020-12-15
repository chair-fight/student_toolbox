import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/core/week_day_time.dart';
import 'package:student_toolbox/models/class_model.dart';
import 'package:student_toolbox/models/class_type_model.dart';
import 'package:student_toolbox/placeholders/placeholder_images.dart';
import 'package:student_toolbox/widgets/containters/surface.dart';

class ActivityCard extends StatelessWidget {
  final ClassModel classModel;
  final ClassTypeModel classTypeModel;
  final Function onTap;

  const ActivityCard({Key key, @required this.classModel, this.classTypeModel, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      child: Stack(
        children: [
          Surface(
            height: 90,
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 4, 8, 4),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child: Container(
                          padding: EdgeInsets.only(top: 16),
                          child: Text(
                            classModel.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        child: ClipOval(
                          child: PlaceholderImages.image1,
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 6),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                classModel.professor,
                                style: Theme.of(context).textTheme.bodyText2.copyWith(color: Theme.of(context).textTheme.bodyText2.color.withOpacity(.6)),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            Container(
                              child: Text(
                                classModel.location,
                                style: Theme.of(context).textTheme.bodyText2.copyWith(color: Theme.of(context).textTheme.bodyText2.color.withOpacity(.6)),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              classModel.start.hours.toString().padLeft(2, '0'),
                              style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 24),
                            ),
                            Text(
                              classModel.start.minutes.toString().padLeft(2, '0'),
                              style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 14),
                            ),
                            Text(
                              " - ",
                              style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 24),
                            ),
                            Text(
                              classModel.end.hours.toString().padLeft(2, '0'),
                              style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 24),
                            ),
                            Text(
                              classModel.end.minutes.toString().padLeft(2, '0'),
                              style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 90,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(4), bottomLeft: Radius.circular(4)),
              child: RotatedBox(
                quarterTurns: 1,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.white12,
                  value: (WeekDayTime.now().isBefore(classModel.start))
                      ? 0
                      : (WeekDayTime.now().isAfter(classModel.end))
                          ? 1.0
                          : WeekDayTime.now().subtract(classModel.start).inMinutes() /
                              classModel.end.subtract(classModel.start).inMinutes(),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 4),
            padding: EdgeInsets.symmetric(horizontal: 8),
            height: 18,
            decoration: BoxDecoration(
              color: (classTypeModel != null) ? classTypeModel.color : Colors.grey[800],
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(8)),
            ),
            child: Text(
              (classTypeModel != null) ? classTypeModel.string : "+",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
