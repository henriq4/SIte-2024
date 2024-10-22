import 'package:flutter_modular/flutter_modular.dart';
import 'package:suap_uenp_app/guards/auth_guard.dart';
import 'package:suap_uenp_app/modules/splash/splash_module.dart';

import '../modules/auth/auth_module.dart';
import '../modules/calendar/calendar_module.dart';
import '../modules/core/core_module.dart';
import '../modules/home/home_module.dart';
import '../modules/perfil/perfil_module.dart';
import '../modules/shared/shared_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
        SharedModule(),
        AuthModule(),
        HomeModule(),
        PerfilModule(),
        CalendarModule(),
      ];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/home/',
          module: HomeModule(),
          guards: [AuthGuard()],
        ),
        ModuleRoute(
          '/profile/',
          module: PerfilModule(),
          guards: [AuthGuard()],
        ),
        ModuleRoute(
          '/calendar/',
          module: CalendarModule(),
          guards: [AuthGuard()],
        ),
        ModuleRoute('/auth/', module: AuthModule()),
        ModuleRoute('/splash/', module: SplashModule())
      ];
}
