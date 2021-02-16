import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/core/week_day_time.dart';
import 'package:student_toolbox/models/schedule_entry_model.dart';
import 'package:student_toolbox/models/schedule_entry_label_model.dart';

class ActivityEditCard extends StatelessWidget {
  final ScheduleEntryModel classModel;
  final ScheduleEntryLabelModel classTypeModel;
  final Function onTap;

  const ActivityEditCard(
      {Key key, @required this.classModel, this.classTypeModel, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: Form(
        child: Material(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Target Schedule",
                        style: Theme.of(context).textTheme.subtitle1),
                    ToggleButtons(
                      renderBorder: false,
                      isSelected: [true, false],
                      children: ["Week 1", "Week 2"]
                          .map((e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(e),
                              ))
                          .toList(),
                      onPressed: (int index) {},
                      fillColor: Colors.transparent,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(.5),
                    ),
                    Text("Week Day",
                        style: Theme.of(context).textTheme.subtitle1),
                    ToggleButtons(
                      renderBorder: false,
                      isSelected:
                          WeekDayTime.weekDays.map((e) => false).toList(),
                      children: WeekDayTime.weekDays
                          .map((e) => Text(e.substring(0, 3)))
                          .toList(),
                      onPressed: (int index) {},
                      fillColor: Colors.transparent,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(.5),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Start Time",
                                style: Theme.of(context).textTheme.subtitle1),
                            Row(
                              children: [
                                Container(
                                  width: 48,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: "HH",
                                    ),
                                  ),
                                ),
                                Text(":",
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                Container(
                                  width: 48,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: "MM",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 64),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Duration",
                                style: Theme.of(context).textTheme.subtitle1),
                            Row(
                              children: [
                                Container(
                                  width: 48,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: "HH",
                                    ),
                                  ),
                                ),
                                Text(":",
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                Container(
                                  width: 48,
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: "MM",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 42,
                      width: 48,
                      child: RawMaterialButton(
                        onPressed: () {},
                        child: Icon(Icons.remove_red_eye),
                      ),
                    ),
                    SizedBox(
                      height: 42,
                      width: 48,
                      child: RawMaterialButton(
                        onPressed: () {},
                        child: Icon(Icons.close, color: Colors.redAccent),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
