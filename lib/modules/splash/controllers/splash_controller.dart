import 'package:flutter_modular/flutter_modular.dart';
import 'package:suap_uenp_app/app/app_module.dart';

class SplashController {
  SplashController() {
    _initSplash();
  }

  _initSplash() async {
    await Modular.isModuleReady<AppModule>();
    Modular.to.navigate('/home/');
  }
}
