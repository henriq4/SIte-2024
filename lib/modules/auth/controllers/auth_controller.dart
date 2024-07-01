import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suap_uenp_app/modules/auth/repositories/auth_repository.dart';

class AuthController {
  final SharedPreferences store;
  final AuthRepository repository;

  AuthController(this.store, this.repository);

  bool get isAuthenticated => store.containsKey('token');

  Future<void> login() async {
    try {
      final login = await repository.login();

      await store.setString('token', login.access);
      await store.setString('refreshToken', login.refresh);

      Modular.to.pushReplacementNamed('/home/');
    } catch (e) {
      print("");
    }
  }

  Future<void> logout() async {
    await store.remove('token');

    Modular.to.navigate('/auth/');
  }
}
