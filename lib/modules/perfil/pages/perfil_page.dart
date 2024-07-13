import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:suap_uenp_app/modules/auth/controllers/auth_controller.dart';
import 'package:suap_uenp_app/modules/perfil/controllers/user_controller.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final controller = Modular.get<UserController>();
  final authController = Modular.get<AuthController>();

  @override
  void initState() {
    super.initState();
    controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: true,
      ),
      body: AnimatedBuilder(
        animation: Listenable.merge([
          controller.isLoading,
          controller.error,
          controller.state,
        ]),
        builder: (context, child) {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.error.value.isNotEmpty) {
            return Center(
              child: Text(
                controller.error.value,
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }

          var user = controller.state.value;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                          "https://suap.uenp.edu.br${user.photo_url}",
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(user.nome_usual),
                        Text(user.tipo_vinculo),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("Mural"),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Card.filled(
                            color: Colors.grey.shade200,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.book_rounded),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 6.0,
                                      bottom: 10.0,
                                    ),
                                    child: Text("Documentos"),
                                  ),
                                  Text(
                                    "clique para ver seus docmentos",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card.filled(
                            color: Colors.grey.shade200,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.person),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 6.0,
                                      bottom: 10.0,
                                    ),
                                    child: Text("Dados pessoais"),
                                  ),
                                  Text(
                                    "clique para ver suas informações pessoais",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Card.filled(
                            color: Colors.grey.shade200,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.calendar_today_rounded),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 6.0,
                                      bottom: 10.0,
                                    ),
                                    child: Text("Disciplinas"),
                                  ),
                                  Text(
                                    "clique para ver suas disciplinas cadastradas",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card.filled(
                            color: Colors.grey.shade200,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.call_rounded),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 6.0,
                                      bottom: 10.0,
                                    ),
                                    child: Text("Chamados"),
                                  ),
                                  Text(
                                    "clique para ver seus chamados",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: authController.logout,
                child: Text("Sair"),
              ),
            ],
          );
        },
      ),
    );
  }
}
