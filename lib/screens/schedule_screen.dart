import 'package:flutter/material.dart';
import 'package:student_toolbox/models/activity_label_model.dart';
import 'package:student_toolbox/models/activity_model.dart';
import 'package:student_toolbox/models/schedule_model.dart';
import 'package:student_toolbox/services/firebase_data.dart';
import 'package:student_toolbox/widgets/activities/activity_card.dart';
import 'package:student_toolbox/widgets/activities/schedule_break_card.dart';
import 'package:student_toolbox/widgets/column_divider.dart';

class ScheduleScreen extends StatelessWidget {
  // final List<ClassModel> classModelList = [
  //   ClassModel(
  //     0,
  //     name: "Databases",
  //     start: WeekDayTime(weekDay: 0, hours: 10, minutes: 0),
  //     end: WeekDayTime(weekDay: 0, hours: 12, minutes: 0),
  //     professor: "Asist. Pop Emilia",
  //     location: "Online",
  //     weekId: [0, 1],
  //     classTypeID: 3,
  //   ),
  //   ClassModel(
  //     0,
  //     name: "Advanced Programming Methods",
  //     start: WeekDayTime(weekDay: 0, hours: 12, minutes: 0),
  //     end: WeekDayTime(weekDay: 0, hours: 14, minutes: 0),
  //     professor: "Drd. Cristea Daniela",
  //     location: "Online",
  //     weekId: [0, 1],
  //     classTypeID: 3,
  //   ),
  //   ClassModel(
  //     0,
  //     name: "Functional & Logical Programming",
  //     start: WeekDayTime(weekDay: 0, hours: 14, minutes: 0),
  //     end: WeekDayTime(weekDay: 0, hours: 16, minutes: 0),
  //     professor: "Asist. Miholca Diana",
  //     location: "Online",
  //     weekId: [0, 1],
  //     classTypeID: 3,
  //   ),
  //   ClassModel(
  //     0,
  //     name: "Tutoring",
  //     start: WeekDayTime(weekDay: 0, hours: 18, minutes: 0),
  //     end: WeekDayTime(weekDay: 0, hours: 20, minutes: 0),
  //     professor: "Drd. Mursa Bogdan",
  //     location: "Online",
  //     weekId: [0, 1],
  //     classTypeID: null,
  //   ),
  //   ClassModel(
  //     0,
  //     name: "Probability & Statistics",
  //     start: WeekDayTime(weekDay: 1, hours: 10, minutes: 0),
  //     end: WeekDayTime(weekDay: 1, hours: 12, minutes: 0),
  //     professor: "Conf. Micula Sanda",
  //     location: "Online",
  //     weekId: [0, 1],
  //     classTypeID: 1,
  //   ),
  //   ClassModel(
  //     0,
  //     name: "Databases",
  //     start: WeekDayTime(weekDay: 1, hours: 14, minutes: 0),
  //     end: WeekDayTime(weekDay: 1, hours: 16, minutes: 0),
  //     professor: "Asist. Pop Emilia",
  //     weekId: [0, 1],
  //     location: "Online",
  //     classTypeID: 2,
  //   ),
  //   ClassModel(
  //     0,
  //     name: "Probability & Statistics",
  //     start: WeekDayTime(weekDay: 1, hours: 16, minutes: 0),
  //     end: WeekDayTime(weekDay: 1, hours: 18, minutes: 0),
  //     professor: "Conf. Micula Sanda",
  //     weekId: [0, 1],
  //     location: "Online",
  //     classTypeID: 2,
  //   ),
  //   ClassModel(
  //     0,
  //     name: "Computer Networks",
  //     start: WeekDayTime(weekDay: 2, hours: 8, minutes: 0),
  //     end: WeekDayTime(weekDay: 2, hours: 10, minutes: 0),
  //     professor: "Conf. Darabant Sergiu",
  //     weekId: [0, 1],
  //     location: "Online",
  //     classTypeID: 1,
  //   ),
  //   ClassModel(
  //     0,
  //     name: "Databases",
  //     start: WeekDayTime(weekDay: 2, hours: 10, minutes: 0),
  //     end: WeekDayTime(weekDay: 2, hours: 12, minutes: 0),
  //     professor: "Lect. Surdu Sabina",
  //     weekId: [0, 1],
  //     location: "Online",
  //     classTypeID: 1,
  //   ),
  //   ClassModel(
  //     0,
  //     name: "Functional & Logical Programming",
  //     start: WeekDayTime(weekDay: 2, hours: 18, minutes: 0),
  //     end: WeekDayTime(weekDay: 2, hours: 20, minutes: 0),
  //     professor: "Prof. Pop Horia",
  //     weekId: [0, 1],
  //     location: "Online",
  //     classTypeID: 1,
  //   ),
  //   ClassModel(
  //     0,
  //     name: "Functional & Logical Programming",
  //     start: WeekDayTime(weekDay: 3, hours: 8, minutes: 0),
  //     end: WeekDayTime(weekDay: 3, hours: 10, minutes: 0),
  //     professor: "Lect. Onet-Marian Zsuzsanna",
  //     weekId: [0, 1],
  //     location: "Online",
  //     classTypeID: 2,
  //   ),
  //   ClassModel(
  //     0,
  //     name: "Advanced Programming Methods",
  //     start: WeekDayTime(weekDay: 3, hours: 14, minutes: 0),
  //     end: WeekDayTime(weekDay: 3, hours: 16, minutes: 0),
  //     professor: "Conf. Craciun Florin",
  //     weekId: [0, 1],
  //     location: "Online",
  //     classTypeID: 1,
  //   ),
  //   ClassModel(
  //     0,
  //     name: "Advanced Programming Methods",
  //     start: WeekDayTime(weekDay: 3, hours: 16, minutes: 0),
  //     end: WeekDayTime(weekDay: 3, hours: 18, minutes: 0),
  //     professor: "Conf. Craciun Florin",
  //     weekId: [0, 1],
  //     location: "Online",
  //     classTypeID: 2,
  //   ),
  //   ClassModel(
  //     0,
  //     name: "English",
  //     start: WeekDayTime(weekDay: 3, hours: 18, minutes: 0),
  //     end: WeekDayTime(weekDay: 3, hours: 20, minutes: 0),
  //     professor: "Asist. Lazar Adriana",
  //     weekId: [0, 1],
  //     location: "Online",
  //     classTypeID: null,
  //   ),
  //   ClassModel(
  //     0,
  //     name: "Computer Networks",
  //     start: WeekDayTime(weekDay: 4, hours: 18, minutes: 0),
  //     end: WeekDayTime(weekDay: 4, hours: 20, minutes: 0),
  //     professor: "Lect. Dragos Radu",
  //     weekId: [0, 1],
  //     location: "Online",
  //     classTypeID: 3,
  //   ),
  // ];

  final List<ActivityLabelModel> classTypeModelList = [
    ActivityLabelModel(
      '1',
      color: Colors.red,
      string: "Lecture",
    ),
    ActivityLabelModel(
      '2',
      color: Colors.blue,
      string: "Seminar",
    ),
    ActivityLabelModel(
      '3',
      color: Colors.green,
      string: "Laboratory",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ScheduleModel>>(
        future: ScheduleModelFirebaseData.getSchedules(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<ScheduleModel>> snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("Something went wrong\n" + snapshot.error.toString()),
              ),
            );
          }
          return DefaultTabController(
            length: snapshot.data.length,
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: 48,
                bottom: TabBar(
                  tabs: (snapshot.data != null)
                      ? snapshot.data
                          .map(
                            (e) => Container(
                              height: 40,
                              child: Tab(text: e.name),
                            ),
                          )
                          .toList()
                      : [],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Theme.of(context).colorScheme.primary,
                splashColor: Theme.of(context).colorScheme.secondary,
                child: Icon(Icons.edit),
                onPressed: () {},
              ),
              body: TabBarView(
                children: (snapshot.data != null)
                    ? snapshot.data
                        .map(
                          (e) => ListView(children: _buildGroupedActivities(context)..add(SizedBox(height: 86))),
                        )
                        .toList()
                    : [],
              ),
            ),
          );
        });
  }

  List<Widget> _buildGroupedActivities(BuildContext context) {
    List<Widget> result = [];
    List<ActivityModel> set;
    List<String> days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];

    List<ActivityModel> activityModelList = [];

    if (activityModelList == null || activityModelList.isEmpty) return result;

    ActivityModel lastClassModel;
    (activityModelList..sort((lhs, rhs) => lhs.start.compareTo(rhs.start))).forEach((classModel) {
      if (lastClassModel == null || lastClassModel.start.weekDay != classModel.start.weekDay) {
        result.add(ColumnDivider(label: days[classModel.start.weekDay]));
      } else if (lastClassModel != null && !lastClassModel.end.equals(classModel.start)) {
        result.add(ScheduleBreakCard(start: lastClassModel.end, end: classModel.start));
      }
      result.add(ActivityCard(
        classModel: classModel,
        classTypeModel: classModel.classTypeID != null ? classTypeModelList.firstWhere((classType) => classModel.classTypeID == classType.id) : null,
      ));
      lastClassModel = classModel;
    });

    return result;
  }
}
