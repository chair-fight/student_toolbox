import 'package:flutter/material.dart';

class ClassTypeModel {
  int id;
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
    id = int.parse(list[0]);
    color = Color(int.parse(list[1]));
    string = list[2];
  }

  static ClassTypeModel get placeholder {
    return ClassTypeModel(
      0,
      color: Colors.blueGrey,
      string: "Placeholder",
    );
  }
}
