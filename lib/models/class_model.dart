import 'package:flutter/material.dart';

class ClassModel {
  final String name;
  final TimeOfDay start;
  final Duration duration;
  final bool week1;
  final bool week2;

  ClassModel({this.name, this.start, this.duration, this.week1, this.week2});
}
