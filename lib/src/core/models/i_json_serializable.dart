/// Contract to support json serialization

abstract class JsonSerializable<T> {
  Map<String, dynamic> toJson();

  ///Usually the `fromJson` method is just a wrapper of a factory constructor such as:
  ///`Model.fromJson(Map<String, dynamic> json) => Model()`
  ///and the method could be implemented as:
  /// `Model fromJson(Map<String, dynamic> json) => Model.fromJson(json);`
  /// This is made due to the inability to declare factory constructors in abstract classes
  /// and the need to have an homogeneous interface when dealing with json Models
  T fromJson(Map<String, dynamic> json);
}
