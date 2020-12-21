class ScheduleModel {
  String id;
  String name;
  List<String> classIds;

  ScheduleModel(id, {this.name, this.classIds}) {
    this.id = id;
  }

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    classIds = List.from(json['classIds']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'classIds': classIds,
    };
  }
}
