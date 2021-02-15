import 'package:intl/intl.dart';
import 'package:student_toolbox/models/model.dart';

class AssignmentModel extends Model {
  String id;
  String name;
  DateTime dueDate;
  bool isFinished;

  AssignmentModel(
    this.id,
    this.name,
    this.dueDate,
    this.isFinished,
  );

  @override
  AssignmentModel.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    id = json['id'];
    name = json['name'];
    dueDate = DateFormat.yMd().parseLoose(json['dueDate']);
    isFinished = json['isFinished'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'dueDate': DateFormat.yMd().format(dueDate),
      'isFinished': isFinished,
    };
  }

  @override
  AssignmentModel.placeholder() : super.placeholder() {
    id = '';
    name = 'Placeholder Assignment';
    dueDate = DateTime.now();
    isFinished = false;
  }

  @override
  bool valid() {
    return id.isEmpty || name.isEmpty || name.startsWith(" ") || name.endsWith(" ");
  }

  @override
  void validate() {
    name = name.trim();
  }
}
