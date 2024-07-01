import 'package:flutter_modular/flutter_modular.dart';
import 'package:suap_uenp_app/modules/auth/repositories/auth_repository.dart';

import 'controllers/auth_controller.dart';
import 'pages/login_page.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => AuthRepository(i()), export: true),
        Bind.lazySingleton((i) => AuthController(i(), i()), export: true),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, args) => LoginPage()),
      ];
}
