import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/splash_controller.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPage({super.key}) {
    Modular.get<SplashController>();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Splash"),
      ),
    );
  }
}
