import 'package:flutter_modular/flutter_modular.dart';

import 'pages/login_page.dart';

class AuthModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, args) => const LoginPage()),
      ];
}
