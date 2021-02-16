abstract class Model {
  Model();

  Model placeholder();

  Model fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();

  bool valid();
}
