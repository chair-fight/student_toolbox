import 'package:flutter/material.dart';
import 'package:student_toolbox/models/class_type_model.dart';

class LocalData {
  static List<ClassTypeModel> getClassTypeModels() {
    return [
      ClassTypeModel(
        1,
        color: Colors.red,
        string: "Lecture",
      ),
      ClassTypeModel(
        2,
        color: Colors.blue,
        string: "Seminar",
      ),
      ClassTypeModel(
        3,
        color: Colors.green,
        string: "Laboratory",
      ),
      ClassTypeModel(
        4,
        color: Colors.orange,
        string: "Practical Course",
      ),
      ClassTypeModel(
        6,
        color: Colors.purple,
        string: "Personal",
      ),
    ];
  }

  static List<String> getSchedules() {
    return [
      "Week 1",
      "Week 2",
    ];
  }
}
