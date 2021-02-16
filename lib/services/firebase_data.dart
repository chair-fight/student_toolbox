import 'package:student_toolbox/models/activity_label_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_toolbox/models/assignment_model.dart';
import 'package:student_toolbox/models/schedule_model.dart';
import 'package:student_toolbox/models/activity_model.dart';

class FirebaseDataException implements Exception {
  String _cause;

  get cause => _cause;

  String toString() => "FirebaseDataException: $cause";

  FirebaseDataException(this._cause);
}

class AssignmentModelFirebaseData {
  static CollectionReference _assignmentCollection;

  static _init() {
    _assignmentCollection = FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseData._uid)
        .collection("Assignments");
  }

  static _checkInitialized() {
    if (_assignmentCollection == null)
      throw new FirebaseDataException("Firebase data not initialized.");
  }

  static Future<List<AssignmentModel>> getAssignmentModels() async {
    _checkInitialized();
    return _assignmentCollection.get().then((queryData) =>
        queryData.docs
            .map((almData) =>
            AssignmentModel.fromJson(
                almData.data()
                  ..addAll({'id': almData.id})
            )
        ).toList());
    }

  static Future<String> addAssignmentModel(AssignmentModel assignmentModel) async {
    _checkInitialized();
    return _assignmentCollection
        .add(assignmentModel.toJson()
          ..remove('id'))
          .then((documentReference) => documentReference.id);
  }

  static Future<void> updateAssignmentModel(AssignmentModel assignmentModel) async {
    _checkInitialized();
    return _assignmentCollection
        .doc(assignmentModel.id)
        .set(assignmentModel.toJson()
      ..remove('id'));
  }

  static Future<void> deleteAssignmentModel(String id) async {
    _checkInitialized();
    return _assignmentCollection.doc(id).delete();
  }
}

class ActivityLabelModelFirebaseData {
  static CollectionReference _activityCollection;

  static _init() {
    FirebaseData._checkInitialized();
    _activityCollection = FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseData._uid)
        .collection("ScheduleData")
        .doc("ActivityTypes")
        .collection("ActivityTypes");

  }

  static _checkInitialized() {
    if (_activityCollection == null)
      throw new FirebaseDataException("Firebase data not initialized.");
  }



  static Future<List<ActivityLabelModel>> getActivityLabelModels() async {
    _checkInitialized();
    return _activityCollection.get().then((queryData) =>
        queryData.docs
            .map((almData) =>
            ActivityLabelModel.fromJson(
                almData.data()
                  ..addAll({'id': almData.id})))
            .toList());
  }

  static Stream<List<ActivityLabelModel>> getObservableActivityLabelModels() {
    _checkInitialized();
    return _activityCollection.snapshots(includeMetadataChanges: true).map(
            (event) =>
            event.docs
                .map((almData) =>
                ActivityLabelModel.fromJson(
                    almData.data()
                      ..addAll({'id': almData.id})))
                .toList());
  }

  static Future<ActivityLabelModel> getActivityLabelModel(String id) async {
    _checkInitialized();
    return _activityCollection.doc(id).get().then((doc) =>
    doc.exists
        ? ActivityLabelModel.fromJson(doc.data()
      ..addAll({'id': id}))
        : null);
  }

  static Stream<ActivityLabelModel> getObservableActivityLabelModel(String id) {
    _checkInitialized();
    return _activityCollection
        .doc(id)
        .snapshots(includeMetadataChanges: true)
        .map((doc) =>
    doc.exists
        ? ActivityLabelModel.fromJson(doc.data()
      ..addAll({'id': id}))
        : null);
  }

  static Future<String> addActivityLabelModel(ActivityLabelModel activityLabelModel) async {
    _checkInitialized();
    return _activityCollection
        .add(activityLabelModel.toJson()
      ..remove('id'))
        .then((documentReference) => documentReference.id);
  }

  static Future<void> updateActivityLabelModel(ActivityLabelModel activityLabelModel) async {
    _checkInitialized();
    return _activityCollection
        .doc(activityLabelModel.id)
        .set(activityLabelModel.toJson()
      ..remove('id'));
  }

  static Future<void> deleteActivityLabelModel(String id) async {
    _checkInitialized();
    return _activityCollection.doc(id).delete();
  }
}

class ScheduleModelFirebaseData {
  static CollectionReference _scheduleCollection;
  static CollectionReference _activityCollection;
  static DocumentReference _scheduleOrder;

  static _init() {
    ActivityLabelModelFirebaseData._checkInitialized();
    _scheduleCollection = FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseData._uid)
        .collection("ScheduleData")
        .doc("Schedules")
        .collection("Schedules");
    _activityCollection = FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseData._uid)
        .collection("ScheduleData")
        .doc("Activities")
        .collection("Activities");
    _scheduleOrder = FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseData._uid)
        .collection("ScheduleData")
        .doc("ActivityOrder");
  }

  static _checkInitialized() {
    if (_scheduleCollection == null ||
        _activityCollection == null ||
        _scheduleOrder == null)
      throw new FirebaseDataException("Schedule data not initialized.");
  }

  static Future<List<ScheduleModel>> getSchedules() async {
    _checkInitialized();
    int index = 0;
    Map<String, int> orderMap = {};
    (await _scheduleOrder.get().then((doc) => doc.data()['order']))
        .forEach((element) {
      orderMap.addAll({element: index++});
    });

    return _scheduleCollection.get().then((queryData) =>
    queryData.docs
        .map((scheduleData) =>
        ScheduleModel.fromJson(
            scheduleData.data()
              ..addAll({'id': scheduleData.id})))
        .toList()
      ..sort((first, second) => orderMap[first.id] - orderMap[second.id]));
  }

  static Stream<List<ScheduleModel>> getObservableSchedules() {
    _checkInitialized();
    print(_scheduleOrder);
    return _scheduleOrder
        .snapshots()
        .map((doc) => List.of(doc.data()['order']).cast<String>())
        .asyncExpand((order) {
      int index = 0;
      Map<String, int> orderMap = {};
      order.forEach((element) {
        orderMap.addAll({element: index++});
      });
      return _scheduleCollection.snapshots(includeMetadataChanges: true).map(
              (event) =>
          event.docs
              .map((scheduleData) =>
              ScheduleModel.fromJson(
                  scheduleData.data()
                    ..addAll({'id': scheduleData.id})))
              .toList()
            ..sort((a, b) => orderMap[a.id] - orderMap[b.id]));
    });
  }

  static Future<ScheduleModel> getSchedule(String id) async {
    _checkInitialized();
    return _scheduleCollection.doc(id).get().then((doc) =>
    doc.exists
        ? ScheduleModel.fromJson(doc.data()
      ..addAll({'id': doc.id}))
        : null);
  }

  static Stream<ScheduleModel> getObservableSchedule(String id) {
    _checkInitialized();
    return _scheduleCollection
        .doc(id)
        .snapshots(includeMetadataChanges: true)
        .map((doc) =>
    doc.exists
        ? ScheduleModel.fromJson(doc.data()
      ..addAll({'id': doc.id}))
        : null);
  }

  static Future<String> addSchedule(ScheduleModel scheduleModel, int position) async {
    _checkInitialized();
    return _scheduleOrder.get().then((document) {
      if (!document.exists) return [];
      return List.of(document.data()['order']).cast<String>();
    }).then((order) {
      if (position > order.length)
        throw new FirebaseDataException("Invalid insertion position");
      return _scheduleCollection
          .add(scheduleModel.toJson()
        ..remove('id'))
          .then((doc) {
        order.insert(position, doc.id);
        _scheduleOrder.set({'order': order});
        return doc.id;
      });
    });
  }

  static Future<void> deleteSchedule(String id) async {
    _checkInitialized();
    return _scheduleOrder.get().then((doc) {
      _scheduleOrder.set({'order': List.of(doc.data()['order'])
        ..remove(id)});
      _scheduleCollection.doc(id).delete();
    });
  }

  static Future<void> updateSchedule(ScheduleModel scheduleModel) async {
    _checkInitialized();
    return _scheduleCollection
        .doc(scheduleModel.id)
        .set(scheduleModel.toJson()
      ..remove('id'));
  }

  static Future<void> moveScheduleToPosition(String id, int position) async {
    _checkInitialized();
    return _scheduleOrder
        .get()
        .then((doc) => List.of(doc.data()['order']).cast<String>())
        .then((order) {
      if (position > order.length)
        throw new FirebaseDataException("Invalid insertion position");
      order.remove(id);
      order.insert(position, id);
      return _scheduleOrder.set({'order': order});
    });
  }

  static Future<ActivityModel> getActivity(String id) async {
    _checkInitialized();
    return _activityCollection.doc(id).get().then((doc) =>
    doc.exists
        ? ActivityModel.fromJson(doc.data()
      ..addAll({'id': doc.id}))
        : null);
  }

  static Stream<ActivityModel> getObservableActivity(String id) {
    _checkInitialized();
    return _activityCollection
        .doc(id)
        .snapshots(includeMetadataChanges: true)
        .map((doc) =>
    doc.exists
        ? ActivityModel.fromJson(doc.data()
      ..addAll({'id': doc.id}))
        : null);
  }

  static Future<String> addActivity(ActivityModel activityModel) async {
    _checkInitialized();
    return _activityCollection
        .add(activityModel.toJson()
      ..remove('id'))
        .then((doc) => doc.id);
  }

  static Future<void> deleteActivity(String id) async {
    _checkInitialized();
    return _activityCollection.doc(id).delete();
  }

  static Future<void> updateActivity(ActivityModel activityModel) async {
    _checkInitialized();
    return _activityCollection
        .doc(activityModel.id)
        .set(activityModel.toJson()
      ..remove('id'));
  }
}

class FirebaseData {
  static String _uid = "";

  static init(String userId) async {
    _uid = userId;
    AssignmentModelFirebaseData._init();
    ActivityLabelModelFirebaseData._init();
    ScheduleModelFirebaseData._init();
  }

  static bool _checkInitialized() {
    return _uid != "";
  }

  static List<String> getSchedules() {
    return [
      "Week 1",
      "Week 2",
    ];
  }
}
