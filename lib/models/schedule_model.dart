import 'package:student_toolbox/models/model.dart';

abstract class ScheduleModel extends Model {
  int get sid;

  String get name;

  List<int> get scheduleEntrySeidList;
}
