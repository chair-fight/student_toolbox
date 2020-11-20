import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserModel {
  final String name;
  final String surname;
  final String email;
  final Image photo;
  final String university;
  final String gender;
  final DateTime dateOfBirth;
  final User metaUser;

  UserModel({
    this.name,
    this.surname,
    this.email,
    this.photo,
    this.university,
    this.gender,
    this.dateOfBirth,
    this.metaUser,
  });
}
