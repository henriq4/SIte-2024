import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suap_uenp_app/infra/api/http/http_client.dart';

class CoreModule extends Module {
  @override
  List<Bind> get binds => [
        AsyncBind((i) => SharedPreferences.getInstance(), export: true),
        Bind.lazySingleton(
          (i) => ApiClient(i()).client,
          export: true,
        ),
      ];
}
