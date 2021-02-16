/*import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:student_toolbox/models/assignment_model.dart';
import 'package:student_toolbox/models/group_model.dart';
import 'package:student_toolbox/models/post_model.dart';
import 'package:student_toolbox/models/reminder_model.dart';
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

class _TempPostModel {
  String pid;
  String gid;
  String opid;
  String title;
  String text;
  DateTime datePosted;

  _TempPostModel({
    this.pid,
    this.gid,
    this.opid,
    this.title,
    this.text,
    this.datePosted,
  });

  factory _TempPostModel.fromJson(Map<String, dynamic> json, String index) {
    if (json['id'] == null || json['id'][index] == null) return null;
    return _TempPostModel(
      pid: json['id'][index].toString(),
      gid: json['gid'][index].toString(),
      opid: json['uid'][index],
      title: json['title'][index],
      text: json['body'][index],
      datePosted: DateTime.parse(json['post_time'][index]),
    );
    // id, gid, uid, title, body, post_time
  }
}

class Database {
  static const String _url = 'http://d9e27afea139.ngrok.io';
  static const String _registerRoute = 'register';
  static const String _deleteUserRoute = 'delete';
  static const String _getUserRoute = 'get_user_data';
  static const String _createGroupRoute = 'create_group';
  static const String _deleteGroupRoute = 'delete_group';
  static const String _getUserGroupsRoute = 'get_user_groups';
  static const String _getAllUsersRoute = 'get_all_users';
  static const String _updateUserRoute = 'update_user';
  static const String _getGroupMembersRoute = 'get_members';
  static const String _addGroupMemberRoute = 'add_user_to_group';
  static const String _removeGroupMemberRoute = 'remove_user_from_group';
  static const String _addReminderRoute = 'add_reminder';
  static const String _removeReminderRoute = 'delete_reminder';
  static const String _getRemindersRoute = 'get_reminders';
  static const String _addPostRoute = 'add_post';
  static const String _getGroupPostsRoute = 'get_group_posts';
  static const String _checkGroupAdminRoute = 'is_admin';
  static const String _getUserAssignmentsRoute = 'get_assignments';
  static const String _addUserAssignmentRoute = 'add_assignment';
  static const String _deleteUserAssignmentRoute = 'delete_assignment';

  static UserModel _userFromJson(Map<String, dynamic> json, String index, User user) {
    if (json['name'] == null || json['name'][index] == null) return null;
    return UserModel(
      uid: json['id'][index],
      name: json['name'][index],
      surname: json['surname'][index],
      email: json['email'][index],
      university: json['university'][index],
      photo: null, //Image.network(user.photoURL),
    );
  }

  static GroupModel _groupFromJson(Map<String, dynamic> json, String index) {
    if (json['name'] == null || json['name'][index] == null) return null;
    return GroupModel(
      gid: json['id'][index].toString(),
      name: json['name'][index],
      description: json['description'][index],
    );
  }

  static ReminderModel _reminderFromJson(Map<String, dynamic> json, String index) {
    if (json['id'] == null || json['id'][index] == null) return null;
    return ReminderModel(
      rid: json['id'][index].toString(),
      text: json['description'][index],
    );
  }

  static AssignmentModel _assignmentFromJson(Map<String, dynamic> json, String index) {
    if (json['id'] == null || json['id'][index] == null) return null;
    return AssignmentModel(
      json['id'][index].toString(),
      json['name'][index],
      DateTime.parse(json['due_date'][index]),
      json['is_finished'][index],
    );
  } // id, uid, name, description, due_date

  static Future<dynamic> _request(String type, Map<String, String> body, String uri) async {
    print(body);
    var convUri = Uri.parse(uri);
    var request = http.MultipartRequest(type, convUri)..fields.addAll(body);
    http.StreamedResponse result;
    String respStr = "";
    try {
      result = await request.send();
      respStr = await result.stream.bytesToString();
    } catch (e) {}
    var dec = jsonDecode(respStr);
    return dec;
  }

  static Future<void> registerUser(String uid, String name, String surname, String email, String university) async {
    var body = <String, String>{'id': uid, 'name': name, 'surname': surname, 'email': email, 'university': university};
    var dec = await _request('POST', body, _url + '/' + _registerRoute);
    var code = DatabaseCodeResult.fromJson(dec, null)._code;
    if (code == null || code != 100) throw DatabaseException("Database error code " + (code == null ? "" : code.toString()));
  }

  static Future<void> deleteUser(String uid) async {
    var body = <String, String>{
      'id': uid,
    };
    var dec = await _request('POST', body, _url + '/' + _deleteUserRoute);
    var code = DatabaseCodeResult.fromJson(dec, null)._code;
    if (code == null || code != 100) throw DatabaseException("Database error code " + (code == null ? "" : code.toString()));
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
    if (userModel == null) throw DatabaseException("Invalid user data received from the database");
    return userModel;
  }

  static Future<UserModel> getDBUserFromUid(String uid) async {
    var body = <String, String>{
      'id': uid,
    };
    print(body);
    var dec = await _request('GET', body, _url + '/' + _getUserRoute);
    dec = jsonDecode(dec);
    UserModel userModel;
    userModel = _userFromJson(dec, '0', null);
    if (userModel == null) throw DatabaseException("Invalid user data received from the database");
    return userModel;
  }

  static Future<void> createGroup(String uid, String name, String description) async {
    var body = <String, String>{'id': uid, 'name': name, 'description': description};
    print(body);
    var dec = await _request('POST', body, _url + '/' + _createGroupRoute);
    var code = DatabaseCodeResult.fromJson(dec, null)._code;
    if (code == null || code != 100) throw DatabaseException("Database error code " + (code == null ? "" : code.toString()));
  }

  static Future<void> deleteGroup(String uid, String gid) async {
    var body = <String, String>{
      'uid': uid,
      'gid': gid,
    };
    print(body);
    var dec = await _request('POST', body, _url + '/' + _deleteGroupRoute);
    var code = DatabaseCodeResult.fromJson(dec, null)._code;
    if (code == null || code != 100) throw DatabaseException("Database error code " + (code == null ? "" : code.toString()));
  }

  static Future<List<GroupModel>> getUserGroups(String uid) async {
    var body = <String, String>{'id': uid};
    print(body);
    var dec = await _request('GET', body, _url + '/' + _getUserGroupsRoute);
    dec = jsonDecode(dec);
    var code = DatabaseCodeResult.fromJson(dec, '0')._code;
    if (code == null || code != 100) throw DatabaseException("Database error code " + (code == null ? "" : code.toString()));
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
    if (code == null || code != 100) throw DatabaseException("Database error code " + (code == null ? "" : code.toString()));
    var currentIndex = 0;
    UserModel currentUser;
    List<UserModel> result = List<UserModel>();
    do {
      currentUser = _userFromJson(dec, (currentIndex++).toString(), null);
      if (currentUser != null) result += [currentUser];
    } while (currentUser != null);
    return result;
  }

  static Future<void> updateUser(String uid, String name, String surname, String email, String university) async {
    var body = <String, String>{'id': uid, 'name': name, 'surname': surname, 'email': email, 'university': university};
    print(body);
    var dec = await _request('POST', body, _url + '/' + _updateUserRoute);
    var code = DatabaseCodeResult.fromJson(dec, null)._code;
    if (code == null || code != 100) throw DatabaseException("Database error code " + (code == null ? "" : code.toString()));
  }

  static Future<List<UserModel>> getGroupMembers(String gid) async {
    var body = <String, String>{
      'gid': gid,
    };
    print(body);
    var dec = await _request('GET', body, _url + '/' + _getGroupMembersRoute);
    dec = jsonDecode(dec);
    var code = DatabaseCodeResult.fromJson(dec, '0')._code;
    if (code == null || code != 100) throw DatabaseException("Database error code " + (code == null ? "" : code.toString()));
    var currentIndex = 0;
    UserModel currentUser;
    List<UserModel> result = List<UserModel>();
    do {
      currentUser = _userFromJson(dec, (currentIndex++).toString(), null);
      if (currentUser != null) result += [currentUser];
    } while (currentUser != null);
    return result;
  }

  static Future<void> addGroupMember(String uid, String other_uid, String gid) async {
    var body = <String, String>{
      'uid': uid,
      'gid': gid,
      'other_uid': other_uid,
    };
    print(body);
    var dec = await _request('POST', body, _url + '/' + _addGroupMemberRoute);
    var code = DatabaseCodeResult.fromJson(dec, null)._code;
    if (code == null || code != 100) throw DatabaseException("Database error code " + (code == null ? "" : code.toString()));
  }

  static Future<void> removeGroupMember(String uid, String other_uid, String gid) async {
    var body = <String, String>{
      'uid': uid,
      'gid': gid,
      'other_uid': other_uid,
    };
    print(body);
    var dec = await _request('POST', body, _url + '/' + _removeGroupMemberRoute);
    var code = DatabaseCodeResult.fromJson(dec, null)._code;
    if (code == null || code != 100) throw DatabaseException("Database error code " + (code == null ? "" : code.toString()));
  }

  static Future<void> addReminder(String uid, String content) async {
    var body = <String, String>{
      'id': uid,
      'description': content,
    };
    print(body);
    var dec = await _request('POST', body, _url + '/' + _addReminderRoute);
    var code = DatabaseCodeResult.fromJson(dec, null)._code;
    if (code == null || code != 100) throw DatabaseException("Database error code " + (code == null ? "" : code.toString()));
  }

  static Future<void> removeReminder(String uid, String rid) async {
    var body = <String, String>{
      'uid': uid,
      'rid': rid,
    };
    print(body);
    var dec = await _request('POST', body, _url + '/' + _removeReminderRoute);
    var code = DatabaseCodeResult.fromJson(dec, null)._code;
    if (code == null || code != 100) throw DatabaseException("Database error code " + (code == null ? "" : code.toString()));
  }

  static Future<List<ReminderModel>> getUserReminders(String uid) async {
    var body = <String, String>{
      'uid': uid,
    };
    print(body);
    var dec = await _request('GET', body, _url + '/' + _getRemindersRoute);
    dec = jsonDecode(dec);
    var code = DatabaseCodeResult.fromJson(dec, '0')._code;
    if (code == null || code != 100) throw DatabaseException("Database error code " + (code == null ? "" : code.toString()));
    var currentIndex = 0;
    ReminderModel currentReminder;
    List<ReminderModel> result = List<ReminderModel>();
    do {
      currentReminder = _reminderFromJson(dec, (currentIndex++).toString());
      if (currentReminder != null) result += [currentReminder];
    } while (currentReminder != null);
    print(result);
    return result;
  }

  static Future<void> addPost(String uid, String gid, String title, String post_body, DateTime post_time) async {
    var body = <String, String>{'uid': uid, 'gid': gid, 'title': title, 'body': post_body, 'post_time': DateFormat('yyyy-MM-ddTHH:mm:ss').format(post_time)};
    print(body);
    var dec = await _request('POST', body, _url + '/' + _addPostRoute);
    var code = DatabaseCodeResult.fromJson(dec, null)._code;
    if (code == null || code != 100) throw DatabaseException("Database error code " + (code == null ? "" : code.toString()));
  }

  static Future<List<PostModel>> getGroupPosts(GroupModel group) async {
    var body = <String, String>{
      'gid': group.gid,
    };
    print(body);
    var dec = await _request('GET', body, _url + '/' + _getGroupPostsRoute);
    dec = jsonDecode(dec);
    var code = DatabaseCodeResult.fromJson(dec, '0')._code;
    if (code == null || code != 100) throw DatabaseException("Database error code " + (code == null ? "" : code.toString()));
    var currentIndex = 0;
    _TempPostModel currentPost;
    List<_TempPostModel> tempResult = List<_TempPostModel>();
    do {
      currentPost = _TempPostModel.fromJson(dec, (currentIndex++).toString());
      if (currentPost != null) tempResult += [currentPost];
    } while (currentPost != null);
    List<PostModel> result = List<PostModel>();
    for (var temppost in tempResult) {
      var op = await getDBUserFromUid(temppost.opid);
      result += [
        PostModel(
          pid: temppost.pid,
          op: op,
          group: group,
          title: temppost.title,
          text: temppost.text,
          datePosted: temppost.datePosted,
        )
      ];
    }
    return result;
  }

  static Future<bool> checkUserGroupAdmin(String uid, String gid) async {
    var body = <String, String>{
      'uid': uid,
      'gid': gid,
    };
    var dec = await _request('GET', body, _url + '/' + _checkGroupAdminRoute);
    var code = DatabaseCodeResult.fromJson(dec, null)._code;
    if (code == null || code != 100) throw DatabaseException("Database error code " + (code == null ? "" : code.toString()));
    return dec['is_admin'] == 'true';
  }

  static Future<List<AssignmentModel>> getUserAssignments(String uid) async {
    var body = <String, String>{
      'id': uid,
    };
    var dec = await _request('GET', body, _url + '/' + _getUserAssignmentsRoute);
    dec = jsonDecode(dec);
    var code = DatabaseCodeResult.fromJson(dec, '0')._code;
    if (code == null || code != 100) throw DatabaseException("Database error code " + (code == null ? "" : code.toString()));
    var currentIndex = 0;
    AssignmentModel currentAssignment;
    List<AssignmentModel> result = List<AssignmentModel>();
    do {
      currentAssignment = _assignmentFromJson(dec, (currentIndex++).toString());
      if (currentAssignment != null) result += [currentAssignment];
    } while (currentAssignment != null);
    return result;
  }

  static Future<void> addUserAssignment(String uid, String name, DateTime dueDate, bool isFinished) async {
    var body = <String, String>{'id': uid, 'name': name, 'due_date': DateFormat('yyyy-MM-ddTHH:mm:ss').format(dueDate), 'is_finished': isFinished.toString()};
    var dec = await _request('POST', body, _url + '/' + _addUserAssignmentRoute);
    var code = DatabaseCodeResult.fromJson(dec, null)._code;
    if (code == null || code != 100) throw DatabaseException("Database error code " + (code == null ? "" : code.toString()));
  }

  static Future<void> deleteUserAssignment(String aid) async {
    var body = <String, String>{
      'id': aid,
    };
    var dec = await _request('POST', body, _url + '/' + _deleteUserAssignmentRoute);
    var code = DatabaseCodeResult.fromJson(dec, null)._code;
    if (code == null || code != 100) throw DatabaseException("Database error code " + (code == null ? "" : code.toString()));
  }
}
*/