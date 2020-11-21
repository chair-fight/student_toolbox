import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_toolbox/services/auth.dart';

class UserModel {
  final String uid;
  final String name;
  final String surname;
  final String email;
  final Image photo;
  final String university;
  final String gender;
  final DateTime dateOfBirth;
  final User metaUser;

  UserModel({
    this.uid,
    this.name,
    this.surname,
    this.email,
    this.photo,
    this.university,
    this.gender,
    this.dateOfBirth,
    this.metaUser,
  });

  static UserModel builtin1() {
    return UserModel(
      name: "Darius",
      surname: "Calugar",
      email: "darius_calugar@yahoo.com",
      university: "Babes Bolyiai University",
      photo: Image.network(
          "https://scontent-otp1-1.xx.fbcdn.net/v/t1.0-9/58377221_2417367858308020_8272458563759112192_n.jpg?_nc_cat=105&ccb=2&_nc_sid=09cbfe&_nc_ohc=V1ay19wnI3kAX8QVwwN&_nc_oc=AQll_5l-MWPnCQMIh79C6cCOIJMR9aRrFgQ-ao4patxdM0QWQtl2JNuUvg4ZoEe-i6k&_nc_ht=scontent-otp1-1.xx&oh=7c12f0f6ba25051045168af0a69dccfe&oe=5FDF2FD8"),
      gender: "Male",
      metaUser: AuthService().currentUser,
      dateOfBirth: DateTime(2000, 11, 13),
    );
  }

  static UserModel builtin2() {
    return UserModel(
      name: "Andrei-Mihai",
      surname: "Petrus",
      email: "makerVD@gmail.com",
      university: "Babes Bolyiai University",
      photo: Image.network(
          "https://scontent-otp1-1.xx.fbcdn.net/v/t1.0-9/30265304_1455239354580770_7292831155525517312_o.jpg?_nc_cat=105&ccb=2&_nc_sid=09cbfe&_nc_ohc=iqPxxgu2CKwAX83pYdc&_nc_ht=scontent-otp1-1.xx&oh=1209c7c38e6b2fe360f608a8ed402b26&oe=5FDDE0A3"),
      gender: "Male",
      metaUser: AuthService().currentUser,
      dateOfBirth: DateTime(2000, 11, 13),
    );
  }
}
