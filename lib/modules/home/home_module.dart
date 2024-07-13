import 'package:flutter_modular/flutter_modular.dart';
import 'package:suap_uenp_app/modules/perfil/perfil_module.dart';

import 'pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        PerfilModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, args) => const HomePage()),
      ];
}
