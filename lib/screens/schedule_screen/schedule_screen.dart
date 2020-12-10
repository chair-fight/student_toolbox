import 'package:flutter/material.dart';
import 'package:student_toolbox/core/week_day_time.dart';
import 'package:student_toolbox/models/class_model.dart';
import 'package:student_toolbox/models/class_type_model.dart';
import 'package:student_toolbox/screens/schedule_screen/class_edit_screen.dart';
import 'package:student_toolbox/widgets/class/class_card.dart';

class ScheduleScreen extends StatelessWidget {
  final List<ClassModel> classModelList = [
    ClassModel(
      0,
      name: "Cringe",
      start: WeekDayTime(weekDay: 3, hours: 20, minutes: 0),
      end: WeekDayTime(weekDay: 3, hours: 22, minutes: 0),
      professor: "Professor Name",
      location: "Location",
    ),
    ClassModel(
      0,
      name: "Databases",
      start: WeekDayTime(weekDay: 4, hours: 12, minutes: 0),
      end: WeekDayTime(weekDay: 4, hours: 12, minutes: 0),
      professor: "Professor Name",
      location: "Location",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 42,
          bottom: TabBar(
            tabs: [
              Container(
                height: 40,
                child: Tab(
                  text: "Week 1",
                ),
              ),
              Container(
                height: 40,
                child: Tab(
                  text: "Week 2",
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          splashColor: Theme.of(context).colorScheme.secondary,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ClassEditScreen()));
          },
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Container(
                  child: Text("Some general data about the next course in the timeline and such should sit here..."),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ClassCard(
                        classModel: ClassModel.placeholder,
                        classTypeModel: ClassTypeModel.placeholder,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  child: Text("Some general data about the next course in the timeline and such should sit here..."),
                ),
                Expanded(
                  child: ListView(
                    children: classModelList
                        .map((e) => ClassCard(
                              classModel: e,
                              classTypeModel: ClassTypeModel.placeholder,
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
