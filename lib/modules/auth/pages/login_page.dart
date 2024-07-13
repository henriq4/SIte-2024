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
      body: AnimatedBuilder(
          animation: Listenable.merge([
            loginController.isLoading,
          ]),
          builder: (context, child) {
            return Form(
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
                  ElevatedButton.icon(
                    onPressed: () {
                      loginController.login(
                        userController.text,
                        passwordController.text,
                      );
                    },
                    icon: loginController.isLoading.value
                        ? Container(
                            width: 24,
                            height: 24,
                            padding: const EdgeInsets.all(2.0),
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 3,
                            ),
                          )
                        : const Icon(Icons.feedback),
                    label: Text("Login"),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
