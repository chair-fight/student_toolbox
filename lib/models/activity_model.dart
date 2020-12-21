import 'package:student_toolbox/core/week_day_time.dart';

class ActivityModel {
  String id;
  String name;
  WeekDayTime start;
  WeekDayTime end;
  String professor;
  String location;
  String classTypeID;

  ActivityModel(
    this.id, {
    this.name,
    this.start,
    this.end,
    this.professor,
    this.location,
    this.classTypeID,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'start': start.inMinutes(),
      'end': end.inMinutes(),
      'professor': professor,
      'location': location,
      'classTypeID': classTypeID
    };
  }

  ActivityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    start = WeekDayTime.fromMinutes(json['start']);
    end = WeekDayTime.fromMinutes(json['end']);
    professor = json['professor'];
    location = json['location'];
    classTypeID = json['classTypeID'];
  }

  static ActivityModel get placeholder {
    return new ActivityModel(
      '0',
      name: "Class Name",
      location: "Location",
      professor: "Professor Name",
      start: WeekDayTime(),
      end: WeekDayTime(),
      classTypeID: '0',
    );
  }
}
