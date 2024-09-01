import 'package:flutter_modular/flutter_modular.dart';
import 'package:suap_uenp_app/modules/calendar/calendar_module.dart';
import 'package:suap_uenp_app/modules/home/controllers/home_controller.dart';
import 'package:suap_uenp_app/modules/home/widgets/layout_widget.dart';
import 'package:suap_uenp_app/modules/perfil/perfil_module.dart';
import 'package:suap_uenp_app/modules/shared/shared_module.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        PerfilModule(),
        CalendarModule(),
        SharedModule(),
      ];

  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => HomeController(i(), i(), i(), i()),
          export: false,
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, args) => const HomeLayout()),
      ];
}
