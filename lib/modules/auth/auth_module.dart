import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/auth_controller.dart';
import 'pages/login_page.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => AuthController(i()), export: true),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, args) => LoginPage()),
      ];
}
