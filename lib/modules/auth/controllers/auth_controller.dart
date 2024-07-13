import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suap_uenp_app/modules/auth/repositories/auth_repository.dart';

class AuthController {
  final SharedPreferences store;
  final AuthRepository repository;

  AuthController(this.store, this.repository);

  final isLoading = ValueNotifier<bool>(false);

  bool get isAuthenticated => store.containsKey('token');

  Future<void> login(String username, String password) async {
    isLoading.value = true;

    try {
      final login = await repository.login("202211113030003", "!HEl7&m*c");
      // final login = await repository.login(username, password);

      await store.setString('token', login.access);
      await store.setString('refreshToken', login.refresh);

      Modular.to.pushReplacementNamed('/home/');
    } catch (e) {
      print("");
    }

    isLoading.value = false;
  }

  Future<void> logout() async {
    await store.remove('token');

    Modular.to.navigate('/auth/');
  }
}
