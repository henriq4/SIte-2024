class TestModel {
  final String id;
  final String type;

  TestModel({
    required this.id,
    required this.type,
  });

  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
      id: json['id'],
      type: json['type'],
    );
  }
}
