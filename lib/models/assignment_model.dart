import 'package:student_toolbox/models/model.dart';

abstract class AssignmentModel extends Model {
  int get aid;

  String get name;

  DateTime get dueDate;
}
