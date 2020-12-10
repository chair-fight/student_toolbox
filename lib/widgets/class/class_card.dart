import 'package:flutter/material.dart';
import 'package:student_toolbox/core/week_day_time.dart';
import 'package:student_toolbox/models/class_model.dart';
import 'package:student_toolbox/models/class_type_model.dart';
import 'package:student_toolbox/widgets/containters/surface.dart';

class ClassCard extends StatelessWidget {
  final ClassModel classModel;
  final ClassTypeModel classTypeModel;

  const ClassCard({Key key, this.classModel, this.classTypeModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Surface(
      children: [
        Column(
          children: [
            Row(
              children: [
                (WeekDayTime.now().isBefore(classModel.end))
                    ? Container(
                        width: 14,
                        height: 14,
                        child: CircularProgressIndicator(
                          value: (WeekDayTime.now().isAfter(classModel.start))
                              ? WeekDayTime.now().subtract(classModel.start).inMinutes() /
                                  (classModel.end.inMinutes() - classModel.start.inMinutes())
                              : 0,
                          backgroundColor: Colors.white10,
                          strokeWidth: 2,
                        ),
                      )
                    : Icon(
                        Icons.check,
                        size: 16,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                Container(
                  padding: EdgeInsets.only(left: 4),
                  child: Text(
                    classModel.name,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ],
            ),
            Divider(),
            Text(classModel.location + " - " + classModel.professor),
            Container(
              child: Text(
                classTypeModel.string,
                textAlign: TextAlign.center,
              ),
              height: 16,
              width: 64,
              decoration: BoxDecoration(color: classTypeModel.color, borderRadius: BorderRadius.circular(8)),
            ),
          ],
        ),
      ],
    );
  }
}
