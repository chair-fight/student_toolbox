import 'package:student_toolbox/models/class_type_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDataException implements Exception {
  String _cause;
  get cause => _cause;
  String toString() => "LocalDataException: $cause";
  FirebaseDataException(this._cause);
}

class ClassTypeModelFirebaseData {
  static CollectionReference _ctmCollection;

  static init() {
    FirebaseData._checkInitialized();
    _ctmCollection = FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseData._uid)
        .collection("ScheduleData")
        .doc("ClassTypes")
        .collection("ClassTypes");
  }

  static _checkInitialized() {
    if (_ctmCollection == null)
      throw new FirebaseDataException("Firebase data not initialized.");
  }

  static Future<List<ClassTypeModel>> getClassTypeModels() async {
    _checkInitialized();
    return _ctmCollection.get().then((queryData) => queryData.docs
        .map((ctmData) =>
            ClassTypeModel.fromJson(ctmData.data()..addAll({'id': ctmData.id})))
        .toList());
  }

  static Stream<List<ClassTypeModel>> getObservableClassTypeModels() {
    _checkInitialized();
    return _ctmCollection.snapshots(includeMetadataChanges: true).map((event) =>
        event.docs
            .map((ctmData) => ClassTypeModel.fromJson(
                ctmData.data()..addAll({'id': ctmData.id})))
            .toList());
  }

  static Future<String> addClassTypeModel(ClassTypeModel ctm) async {
    _checkInitialized();
    return _ctmCollection
        .add(ctm.toJson())
        .then((documentReference) => documentReference.id);
  }

  static Future<ClassTypeModel> getClassTypeModel(String id) async {
    _checkInitialized();
    return _ctmCollection.doc(id).get().then((docData) =>
        ClassTypeModel.fromJson(docData.data()..addAll({'id': id})));
  }

  static Future<void> updateClassTypeModel(ClassTypeModel ctm) async {
    _checkInitialized();
    return _ctmCollection.doc(ctm.id).set(ctm.toJson());
  }

  static Future<void> deleteClassTypeModel(String id) async {
    _checkInitialized();
    _ctmCollection.doc(id).delete();
  }
}

class FirebaseData {
  static String _uid = "";

  static init(String userId) async {
    _uid = userId;
    ClassTypeModelFirebaseData.init();
  }

  static bool _checkInitialized() {
    return _uid != "";
  }

  // static List<ClassTypeModel> getClassTypeModels() {
  //   return [
  //     ClassTypeModel(
  //       1,
  //       color: Colors.red,
  //       string: "Lecture",
  //     ),
  //     ClassTypeModel(
  //       2,
  //       color: Colors.blue,
  //       string: "Seminar",
  //     ),
  //     ClassTypeModel(
  //       3,
  //       color: Colors.green,
  //       string: "Laboratory",
  //     ),
  //     ClassTypeModel(
  //       4,
  //       color: Colors.orange,
  //       string: "Practical Course",
  //     ),
  //     ClassTypeModel(
  //       6,
  //       color: Colors.purple,
  //       string: "Personal",
  //     ),
  //   ];
  // }

  static List<String> getSchedules() {
    return [
      "Week 1",
      "Week 2",
    ];
  }
}
