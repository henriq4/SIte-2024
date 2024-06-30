import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final SharedPreferences store;

  AuthController(this.store);

  bool get isAuthenticated => store.containsKey('token');

  Future<void> login(String token) async {
    try {
      await store.setString('token', token);

      Modular.to.pushReplacementNamed('/home/');
    } catch (e) {
      print(e);
    }
  }

  Future<void> logout() async {
    await store.remove('token');

    Modular.to.navigate('/auth/');
  }
}
