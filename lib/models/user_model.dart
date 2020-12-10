import 'package:flutter/material.dart';

class UserModel {
  final String uid;
  final String name;
  final String surname;
  final String email;
  final Image photo;
  final String university;
  final String gender;
  final DateTime dateOfBirth;

  UserModel({
    @required this.uid,
    @required this.name,
    @required this.surname,
    @required this.email,
    this.photo,
    this.university,
    this.gender,
    this.dateOfBirth,
  });

  static UserModel get placeholder {
    return UserModel(
      uid: "-1",
      name: "Name",
      surname: "Surname",
      email: "email_address@domain.com",
      university: "University Name",
      photo: Image.asset("images/image2.jpg"),
      gender: "Non-Binary",
      dateOfBirth: DateTime(2000, 1, 1),
    );
  }
}
