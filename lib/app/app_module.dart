import 'package:flutter_modular/flutter_modular.dart';
import 'package:suap_uenp_app/guards/auth_guard.dart';
import 'package:suap_uenp_app/modules/auth/auth_module.dart';

import '../modules/core/core_module.dart';
import '../modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
        AuthModule(),
      ];

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module("/", module: HomeModule(), guards: [AuthGuard()]);
    r.module("/auth/", module: AuthModule());
  }
}
