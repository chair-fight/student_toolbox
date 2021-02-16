import 'package:flutter/material.dart';
import 'package:student_toolbox/models/model.dart';

class UserModel implements Model {
  final int uid;
  final String name;
  final String surname;
  final String email;

  UserModel({
    @required this.uid,
    @required this.name,
    @required this.surname,
    @required this.email,
  });

  @override
  UserModel placeholder() => UserModel(
        uid: 0,
        name: "Lorem-Ipsum",
        surname: "Dolor",
        email: "lorem_ipsum@dolor.sit",
      );

  @override
  UserModel fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['uid'],
        name: json['name'],
        surname: json['surname'],
        email: json['email'],
      );

  @override
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'surname': surname,
      'email': email,
    };
  }

  @override
  bool valid() {
    // TODO: implement valid
    throw UnimplementedError();
  }
}
