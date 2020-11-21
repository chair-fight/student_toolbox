import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:student_toolbox/models/group_model.dart';
import 'package:student_toolbox/models/user_model.dart';

class DatabaseException implements Exception {
  final String cause;
  DatabaseException(this.cause);
}

class DatabaseCodeResult {
  int _code;
  get code => _code;
  DatabaseCodeResult.fromJson(Map<String, dynamic> json, String index) {
    if (index == null)
      _code = json.containsKey('code') ? int.parse(json['code']) : 400;
    else
      _code = json.containsKey('code') ? int.parse(json['code'][index]) : 400;
  }
}

class Database {
  static const String _url = 'http://884b10d16848.ngrok.io';
  static const String _registerRoute = 'register';
  static const String _deleteUserRoute = 'delete';
  static const String _getUserRoute = 'get_user_data';
  static const String _createGroupRoute = 'create_group';
  static const String _deleteGroupRoute = 'delete_group';
  static const String _getUserGroupsRoute = 'get_user_groups';
  static const String _getAllUsersRoute = 'get_all_users';
  static const String _updateUserRoute = 'update_user';
  static const String _getGroupMembersRoute = 'get_members';

  static UserModel _userFromJson(
      Map<String, dynamic> json, String index, User user) {
    if (json['name'] == null || json['name'][index] == null) return null;
    return UserModel(
        name: json['name'][index],
        surname: json['surname'][index],
        email: json['email'][index],
        university: json['university'][index],
        photo: null, //Image.network(user.photoURL),
        metaUser: user);
  }

  static GroupModel _groupFromJson(Map<String, dynamic> json, String index) {
    if (json['name'] == null || json['name'][index] == null) return null;
    return GroupModel(
      name: json['name'][index],
      description: json['description'][index],
    );
  }

  static Future<dynamic> _request(
      String type, Map<String, String> body, String uri) async {
    print(body);
    var convUri = Uri.parse(uri);
    var request = http.MultipartRequest(type, convUri)..fields.addAll(body);
    var result = await request.send();
    final respStr = await result.stream.bytesToString();
    var dec = jsonDecode(respStr);
    return dec;
  }

  static Future<void> registerUser(String uid, String name, String surname,
      String email, String university) async {
    var body = <String, String>{
      'id': uid,
      'name': name,
      'surname': surname,
      'email': email,
      'university': university
    };
    var dec = await _request('POST', body, _url + '/' + _registerRoute);
    var code = DatabaseCodeResult.fromJson(dec, null)._code;
    if (code == null || code != 100)
      throw DatabaseException(
          "Database error code " + (code == null ? "" : code.toString()));
  }

  static Future<void> deleteUser(String uid) async {
    var body = <String, String>{
      'id': uid,
    };
    var dec = await _request('POST', body, _url + '/' + _deleteUserRoute);
    var code = DatabaseCodeResult.fromJson(dec, null)._code;
    if (code == null || code != 100)
      throw DatabaseException(
          "Database error code " + (code == null ? "" : code.toString()));
  }

  static Future<UserModel> getDBUser(User user) async {
    var body = <String, String>{
      'id': user.uid,
    };
    print(body);
    var dec = await _request('GET', body, _url + '/' + _getUserRoute);
    dec = jsonDecode(dec);
    UserModel userModel;
    userModel = _userFromJson(dec, '0', user);
    if (userModel == null)
      throw DatabaseException("Invalid user data received from the database");
    return userModel;
  }

  static Future<void> createGroup(
      String uid, String name, String description) async {
    var body = <String, String>{
      'id': uid,
      'name': name,
      'description': description
    };
    print(body);
    var dec = await _request('POST', body, _url + '/' + _createGroupRoute);
    var code = DatabaseCodeResult.fromJson(dec, null)._code;
    if (code == null || code != 100)
      throw DatabaseException(
          "Database error code " + (code == null ? "" : code.toString()));
  }

  static Future<void> deleteGroup(String uid, String gid) async {
    var body = <String, String>{
      'uid': uid,
      'gid': gid,
    };
    print(body);
    var dec = await _request('POST', body, _url + '/' + _deleteGroupRoute);
    var code = DatabaseCodeResult.fromJson(dec, null)._code;
    if (code == null || code != 100)
      throw DatabaseException(
          "Database error code " + (code == null ? "" : code.toString()));
  }

  static Future<List<GroupModel>> getUserGroups(String uid) async {
    var body = <String, String>{'id': uid};
    print(body);
    var dec = await _request('GET', body, _url + '/' + _getUserGroupsRoute);
    dec = jsonDecode(dec);
    var code = DatabaseCodeResult.fromJson(dec, '0')._code;
    if (code == null || code != 100)
      throw DatabaseException(
          "Database error code " + (code == null ? "" : code.toString()));
    var currentIndex = 0;
    GroupModel currentGroup;
    List<GroupModel> result = List<GroupModel>();
    do {
      currentGroup = _groupFromJson(dec, (currentIndex++).toString());
      if (currentGroup != null) result += [currentGroup];
    } while (currentGroup != null);
    return result;
  } // ret id, name, descr

  static Future<List<UserModel>> getAllUsers() async {
    var body = <String, String>{};
    print(body);
    var dec = await _request('GET', body, _url + '/' + _getAllUsersRoute);
    dec = jsonDecode(dec);
    var code = DatabaseCodeResult.fromJson(dec, '0')._code;
    if (code == null || code != 100)
      throw DatabaseException(
          "Database error code " + (code == null ? "" : code.toString()));
    var currentIndex = 0;
    UserModel currentUser;
    List<UserModel> result = List<UserModel>();
    do {
      currentUser = _userFromJson(dec, (currentIndex++).toString(), null);
      if (currentUser != null) result += [currentUser];
    } while (currentUser != null);
    return result;
  }

  static Future<void> updateUser(String uid, String name, String surname,
      String email, String university) async {
    var body = <String, String>{
      'id': uid,
      'name': name,
      'surname': surname,
      'email': email,
      'university': university
    };
    print(body);
    var dec = await _request('POST', body, _url + '/' + _updateUserRoute);
    var code = DatabaseCodeResult.fromJson(dec, null)._code;
    if (code == null || code != 100)
      throw DatabaseException(
          "Database error code " + (code == null ? "" : code.toString()));
  }

  static Future<List<UserModel>> getGroupMembers(String gid) async {
    var body = <String, String>{
      'gid': gid,
    };
    print(body);
    var dec = await _request('GET', body, _url + '/' + _getGroupMembersRoute);
    dec = jsonDecode(dec);
    var code = DatabaseCodeResult.fromJson(dec, '0')._code;
    if (code == null || code != 100)
      throw DatabaseException(
          "Database error code " + (code == null ? "" : code.toString()));
    var currentIndex = 0;
    UserModel currentUser;
    List<UserModel> result = List<UserModel>();
    do {
      currentUser = _userFromJson(dec, (currentIndex++).toString(), null);
      if (currentUser != null) result += [currentUser];
    } while (currentUser != null);
    return result;
  }
}
