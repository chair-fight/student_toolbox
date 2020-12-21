import 'package:flutter/material.dart';

class ActivityLabelModel {
  String id;
  Color color;
  String string;

  ActivityLabelModel(
    this.id, {
    this.color,
    this.string,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'color': color.value,
      'string': string,
    };
  }

  ActivityLabelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    color = Color(json['color']);
    string = json['string'];
  }

  static ActivityLabelModel get placeholder {
    return ActivityLabelModel(
      '0',
      color: Colors.blueGrey,
      string: "Placeholder",
    );
  }
}
