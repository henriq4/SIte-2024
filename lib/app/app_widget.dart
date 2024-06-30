import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  AppWidget({
    super.key,
  }) {
    Modular.setInitialRoute('/splash/');
  }

  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Suap Uenp',
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
