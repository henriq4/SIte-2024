import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:suap_uenp_app/modules/auth/controllers/auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController loginController = Modular.get<AuthController>();

  final _formKey = GlobalKey<FormState>();

  TextEditingController userController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: userController,
              decoration: const InputDecoration(labelText: 'Usuário'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Senha'),
            ),
            ElevatedButton(
              onPressed: () {
                loginController.login(
                  userController.text,
                  passwordController.text,
                );
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
