import 'package:flutter/material.dart';

class ClassTypeModel {
  String id;
  Color color;
  String string;

  ClassTypeModel(
    this.id, {
    this.color,
    this.string,
  });

  List<String> toStringList() {
    return <String>[id.toString(), color.value.toString(), string];
  }

  ClassTypeModel.fromStringList(List<String> list) {
    id = list[0].toString();
    color = Color(int.parse(list[1]));
    string = list[2];
  }

  Map<String, dynamic> toJson() {
    return {'color': color.value, 'string': string};
  }

  ClassTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    color = Color(json['color']);
    string = json['string'];
  }

  static ClassTypeModel get placeholder {
    return ClassTypeModel(
      '0',
      color: Colors.blueGrey,
      string: "Placeholder",
    );
  }
}
