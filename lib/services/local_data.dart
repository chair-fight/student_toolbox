import 'package:student_toolbox/models/class_type_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataException implements Exception {
  String _cause;
  get cause => _cause;
  String toString() => "LocalDataException: $cause";
  LocalDataException(this._cause);
}

class ClassTypeModelLocalData {
  static String _classModelIDsAddress = "";
  static String Function(int) _classModelAddress;
  static init() {
    LocalData._checkInitialized();
    _classModelIDsAddress = LocalData._uid + '/class_models';
    _classModelAddress = (id) => _classModelIDsAddress + '/' + id.toString();
    if (!LocalData._prefs.containsKey(_classModelIDsAddress))
      LocalData._prefs.setStringList(_classModelIDsAddress, <String>[]);
  }

  static _checkInitialized() {
    if (_classModelIDsAddress == "")
      throw LocalDataException("The local data has not yet been initialized.");
  }

  static List<ClassTypeModel> getClassTypeModels() {
    _checkInitialized();
    var lst = LocalData._prefs
            .getStringList(_classModelIDsAddress)
            ?.map((idString) => ClassTypeModel.fromStringList(LocalData._prefs
                .getStringList(_classModelAddress(int.parse(idString)))))
            ?.toList() ??
        <ClassTypeModel>[];
    return lst;
  }

  static Future<bool> setClassTypeModels(List<ClassTypeModel> list) async {
    _checkInitialized();
    return LocalData._prefs
        .setStringList(
            _classModelIDsAddress, list.map((ctm) => ctm.id.toString()))
        .then((idListSetResult) => list
            .map((ctm) async => await LocalData._prefs
                .setStringList(_classModelAddress(ctm.id), ctm.toStringList()))
            .reduce((futureBool1, futureBool2) => (futureBool1.then(
                (value1) => futureBool2.then((value2) => value1 && value2))))
            .then((value) => value && idListSetResult));
  }

  static Future<bool> addClassTypeModel(ClassTypeModel ctm) async {
    _checkInitialized();
    var idList = LocalData._prefs.getStringList(_classModelIDsAddress);
    if (idList.contains(ctm.id.toString()))
      throw LocalDataException("This ctm is already saved!");
    idList.add(ctm.id.toString());
    return LocalData._prefs.setStringList(_classModelIDsAddress, idList).then(
        (idListSetResult) async =>
            idListSetResult &&
            (await LocalData._prefs.setStringList(
                _classModelAddress(ctm.id), ctm.toStringList())));
  }

  static Future<ClassTypeModel> updateClassTypeModel(ClassTypeModel ctm) async {
    _checkInitialized();
    var idList = LocalData._prefs.getStringList(_classModelIDsAddress);
    if (!idList.contains(ctm.id.toString()))
      throw LocalDataException(
          "The class type model with id ${ctm.id} does not exist");
    var oldValue = ClassTypeModel.fromStringList(
        LocalData._prefs.getStringList(_classModelAddress(ctm.id)));
    return LocalData._prefs
        .setStringList(_classModelAddress(ctm.id), ctm.toStringList())
        .then((value) => oldValue);
  }

  static ClassTypeModel getClassTypeModel(int id) {
    _checkInitialized();
    var idList = LocalData._prefs.getStringList(_classModelIDsAddress);
    if (!idList.contains(id.toString()))
      throw LocalDataException(
          "The class type model with id $id does not exist");
    return ClassTypeModel.fromStringList(
        LocalData._prefs.getStringList(_classModelAddress(id)));
  }

  static Future<ClassTypeModel> deleteClassTypeModel(int id) async {
    _checkInitialized();
    var idList = LocalData._prefs.getStringList(_classModelIDsAddress);
    if (!idList.contains(id.toString()))
      throw LocalDataException(
          "The class type model with id $id does not exist");
    idList.remove(id.toString());
    return LocalData._prefs
        .setStringList(_classModelIDsAddress, idList)
        .then((idListSet) async {
      var oldValue = ClassTypeModel.fromStringList(
          LocalData._prefs.getStringList(_classModelAddress(id)));
      await LocalData._prefs.remove(_classModelAddress(id));
      return oldValue;
    });
  }
}


class LocalData {
  static SharedPreferences _prefs;
  static String _uid = "";

  static init(String userId) async {
    _uid = userId;
    _prefs = await SharedPreferences.getInstance();
    ClassTypeModelLocalData.init();
  }

  static _checkInitialized() {
    if (_uid == "")
      throw LocalDataException("The local data has not yet been initialized.");
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
