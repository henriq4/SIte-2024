import 'package:flutter_modular/flutter_modular.dart';
import 'package:suap_uenp_app/modules/home/controllers/test_controller.dart';

import 'pages/home_page.dart';
import 'repositories/test_repository.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => TestRepository(i()), export: true),
        Bind.lazySingleton((i) => TestController(i()), export: true),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, args) => const HomePage()),
      ];
}
