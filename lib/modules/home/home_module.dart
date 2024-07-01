import 'package:flutter_modular/flutter_modular.dart';
import 'package:suap_uenp_app/modules/home/controllers/user_controller.dart';
import 'package:suap_uenp_app/modules/home/repositories/user_repository.dart';

import 'pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => UserRepository(i()), export: true),
        Bind.lazySingleton((i) => UserController(i()), export: true),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, args) => const HomePage()),
      ];
}
