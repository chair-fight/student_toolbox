import 'package:flutter/material.dart';

class PostModel {
  final String title;
  final String text;
  final Image image;
  final DateTime datePosted;

  PostModel({this.title, this.text, this.image, this.datePosted});
}
