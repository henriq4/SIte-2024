import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/auth/');

  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    // return Modular.get<AuthController>().isAuthenticated;
    return true;
  }
}
