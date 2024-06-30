class TestModel {
  late String id;
  late String type;
  late String name;

  TestModel({
    required id,
    required type,
    required name,
  });

  factory TestModel.fromMap(Map<String, dynamic> map) {
    return TestModel(
      id: map['id'],
      type: map['type'],
      name: map['name'],
    );
  }
}
