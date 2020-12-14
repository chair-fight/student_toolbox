import 'package:flutter/material.dart';

class ClassTypeModel {
  final int id;
  Color color;
  String string;

  ClassTypeModel(
    this.id, {
    this.color,
    this.string,
  });

  static ClassTypeModel get placeholder {
    return ClassTypeModel(
      0,
      color: Colors.blueGrey,
      string: "Placeholder",
    );
  }
}
