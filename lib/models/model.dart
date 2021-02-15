abstract class Model {
  Model();

  Model.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();

  Model.placeholder();

  bool valid();

  void validate();
}
