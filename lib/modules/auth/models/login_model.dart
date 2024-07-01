class LoginModel {
  final String access;
  final String refresh;

  LoginModel({
    required this.access,
    required this.refresh,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      access: json['access'],
      refresh: json['refresh'],
    );
  }
}
