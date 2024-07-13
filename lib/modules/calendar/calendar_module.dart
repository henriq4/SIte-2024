import 'package:flutter_modular/flutter_modular.dart';

import 'pages/calendar_page.dart';

class CalendarModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, args) => const CalendarPage()),
      ];
}
