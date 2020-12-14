import 'package:student_toolbox/core/week_day_time.dart';

class ClassModel {
  final int id;
  String name;
  WeekDayTime start;
  WeekDayTime end;
  String professor;
  String location;
  List<int> weekId;
  int classTypeID;

  ClassModel(
    this.id, {
    this.name,
    this.start,
    this.end,
    this.weekId,
    this.professor,
    this.location,
    this.classTypeID,
  });

  static ClassModel get placeholder {
    return new ClassModel(
      0,
      name: "Class Name",
      location: "Location",
      professor: "Professor Name",
      start: WeekDayTime(),
      end: WeekDayTime(),
      weekId: [1],
      classTypeID: 0,
    );
  }
}
