import 'package:flutter_modular/flutter_modular.dart';
import 'package:suap_uenp_app/modules/calendar/calendar_module.dart';
import 'package:suap_uenp_app/modules/home/widgets/layout_widget.dart';
import 'package:suap_uenp_app/modules/perfil/perfil_module.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        PerfilModule(),
        CalendarModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, args) => const HomeLayout()),
      ];
}
