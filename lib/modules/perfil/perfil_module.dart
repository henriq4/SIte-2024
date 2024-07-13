import 'package:flutter_modular/flutter_modular.dart';
import 'package:suap_uenp_app/modules/perfil/controllers/user_controller.dart';
import 'package:suap_uenp_app/modules/perfil/repositories/user_repository.dart';

import 'pages/perfil_page.dart';

class PerfilModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => UserRepository(i()), export: true),
        Bind.lazySingleton((i) => UserController(i(), i()), export: true),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, args) => const PerfilPage()),
      ];
}
