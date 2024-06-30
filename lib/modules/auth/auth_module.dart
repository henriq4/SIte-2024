import 'package:flutter_modular/flutter_modular.dart';
import 'package:suap_uenp_app/modules/core/core_module.dart';

import 'pages/login_page.dart';

class AuthModule extends CoreModule {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child("/", child: (context) => const LoginPage());
  }
}
