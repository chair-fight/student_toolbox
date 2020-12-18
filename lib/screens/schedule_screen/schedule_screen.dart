import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/core/week_day_time.dart';
import 'package:student_toolbox/models/class_model.dart';
import 'package:student_toolbox/models/class_type_model.dart';
import 'package:student_toolbox/screens/schedule_screen/class_edit_screen.dart';
import 'package:student_toolbox/widgets/class/class_card.dart';
import 'package:student_toolbox/widgets/class/schedule_break_card.dart';
import 'package:student_toolbox/widgets/column_divider.dart';

class ScheduleScreen extends StatelessWidget {
  final List<ClassModel> classModelList = [
    ClassModel(
      0,
      name: "Databases",
      start: WeekDayTime(weekDay: 0, hours: 10, minutes: 0),
      end: WeekDayTime(weekDay: 0, hours: 12, minutes: 0),
      professor: "Asist. Pop Emilia",
      location: "Online",
      weekId: [0, 1],
      classTypeID: 3,
    ),
    ClassModel(
      0,
      name: "Advanced Programming Methods",
      start: WeekDayTime(weekDay: 0, hours: 12, minutes: 0),
      end: WeekDayTime(weekDay: 0, hours: 14, minutes: 0),
      professor: "Drd. Cristea Daniela",
      location: "Online",
      weekId: [0, 1],
      classTypeID: 3,
    ),
    ClassModel(
      0,
      name: "Functional & Logical Programming",
      start: WeekDayTime(weekDay: 0, hours: 14, minutes: 0),
      end: WeekDayTime(weekDay: 0, hours: 16, minutes: 0),
      professor: "Asist. Miholca Diana",
      location: "Online",
      weekId: [0, 1],
      classTypeID: 3,
    ),
    ClassModel(
      0,
      name: "Tutoring",
      start: WeekDayTime(weekDay: 0, hours: 18, minutes: 0),
      end: WeekDayTime(weekDay: 0, hours: 20, minutes: 0),
      professor: "Drd. Mursa Bogdan",
      location: "Online",
      weekId: [0, 1],
      classTypeID: null,
    ),
    ClassModel(
      0,
      name: "Probability & Statistics",
      start: WeekDayTime(weekDay: 1, hours: 10, minutes: 0),
      end: WeekDayTime(weekDay: 1, hours: 12, minutes: 0),
      professor: "Conf. Micula Sanda",
      location: "Online",
      weekId: [0, 1],
      classTypeID: 1,
    ),
    ClassModel(
      0,
      name: "Databases",
      start: WeekDayTime(weekDay: 1, hours: 14, minutes: 0),
      end: WeekDayTime(weekDay: 1, hours: 16, minutes: 0),
      professor: "Asist. Pop Emilia",
      weekId: [0, 1],
      location: "Online",
      classTypeID: 2,
    ),
    ClassModel(
      0,
      name: "Probability & Statistics",
      start: WeekDayTime(weekDay: 1, hours: 16, minutes: 0),
      end: WeekDayTime(weekDay: 1, hours: 18, minutes: 0),
      professor: "Conf. Micula Sanda",
      weekId: [0, 1],
      location: "Online",
      classTypeID: 2,
    ),
    ClassModel(
      0,
      name: "Computer Networks",
      start: WeekDayTime(weekDay: 2, hours: 8, minutes: 0),
      end: WeekDayTime(weekDay: 2, hours: 10, minutes: 0),
      professor: "Conf. Darabant Sergiu",
      weekId: [0, 1],
      location: "Online",
      classTypeID: 1,
    ),
    ClassModel(
      0,
      name: "Databases",
      start: WeekDayTime(weekDay: 2, hours: 10, minutes: 0),
      end: WeekDayTime(weekDay: 2, hours: 12, minutes: 0),
      professor: "Lect. Surdu Sabina",
      weekId: [0, 1],
      location: "Online",
      classTypeID: 1,
    ),
    ClassModel(
      0,
      name: "Functional & Logical Programming",
      start: WeekDayTime(weekDay: 2, hours: 18, minutes: 0),
      end: WeekDayTime(weekDay: 2, hours: 20, minutes: 0),
      professor: "Prof. Pop Horia",
      weekId: [0, 1],
      location: "Online",
      classTypeID: 1,
    ),
    ClassModel(
      0,
      name: "Functional & Logical Programming",
      start: WeekDayTime(weekDay: 3, hours: 8, minutes: 0),
      end: WeekDayTime(weekDay: 3, hours: 10, minutes: 0),
      professor: "Lect. Onet-Marian Zsuzsanna",
      weekId: [0, 1],
      location: "Online",
      classTypeID: 2,
    ),
    ClassModel(
      0,
      name: "Advanced Programming Methods",
      start: WeekDayTime(weekDay: 3, hours: 14, minutes: 0),
      end: WeekDayTime(weekDay: 3, hours: 16, minutes: 0),
      professor: "Conf. Craciun Florin",
      weekId: [0, 1],
      location: "Online",
      classTypeID: 1,
    ),
    ClassModel(
      0,
      name: "Advanced Programming Methods",
      start: WeekDayTime(weekDay: 3, hours: 16, minutes: 0),
      end: WeekDayTime(weekDay: 3, hours: 18, minutes: 0),
      professor: "Conf. Craciun Florin",
      weekId: [0, 1],
      location: "Online",
      classTypeID: 2,
    ),
    ClassModel(
      0,
      name: "English",
      start: WeekDayTime(weekDay: 3, hours: 18, minutes: 0),
      end: WeekDayTime(weekDay: 3, hours: 20, minutes: 0),
      professor: "Asist. Lazar Adriana",
      location: "Online",
      weekId: [0, 1],
      classTypeID: null,
    ),
    ClassModel(
      0,
      name: "Computer Networks",
      start: WeekDayTime(weekDay: 4, hours: 18, minutes: 0),
      end: WeekDayTime(weekDay: 4, hours: 20, minutes: 0),
      professor: "Lect. Dragos Radu",
      location: "Online",
      weekId: [0, 1],
      classTypeID: 3,
    ),
  ];

  final List<ClassTypeModel> classTypeModelList = [
    ClassTypeModel(
      '1',
      color: Colors.red,
      string: "Lecture",
    ),
    ClassTypeModel(
      '2',
      color: Colors.blue,
      string: "Seminar",
    ),
    ClassTypeModel(
      '3',
      color: Colors.green,
      string: "Laboratory",
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
          child: Icon(Icons.edit),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ClassEditScreen()));
          },
        ),
        body: TabBarView(
          children: [
            ListView(children: _groupClasses()..add(SizedBox(height: 86))),
            ListView(children: _groupClasses()..add(SizedBox(height: 86))),
          ],
        ),
      ),
    );
  }

  List<Widget> _groupClasses() {
    List<Widget> result = [];
    List<ClassModel> set;
    List<String> days = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];

    if (classModelList == null || classModelList.isEmpty) return result;

    ClassModel lastClassModel;
    (classModelList..sort((lhs, rhs) => lhs.start.compareTo(rhs.start)))
        .forEach((classModel) {
      if (lastClassModel == null ||
          lastClassModel.start.weekDay != classModel.start.weekDay) {
        result.add(ColumnDivider(label: days[classModel.start.weekDay]));
      } else if (lastClassModel != null &&
          !lastClassModel.end.equals(classModel.start)) {
        result.add(ScheduleBreakCard(
            start: lastClassModel.end, end: classModel.start));
      }
      result.add(ClassCard(
        classModel: classModel,
        classTypeModel: classModel.classTypeID != null
            ? classTypeModelList.firstWhere(
                (classType) => classModel.classTypeID == classType.id)
            : null,
      ));
      lastClassModel = classModel;
    });

    return result;
  }
}
