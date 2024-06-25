import 'package:flutter_modular/flutter_modular.dart';

import '../modules/core/core_module.dart';
import '../modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module("/", module: HomeModule());
  }
}
