import 'package:flutter/material.dart';
import 'package:suap_uenp_app/exceptions/not_authorized.dart';
import 'package:suap_uenp_app/modules/auth/controllers/auth_controller.dart';
import 'package:suap_uenp_app/modules/perfil/models/user_models.dart';
import 'package:suap_uenp_app/modules/perfil/repositories/user_repository.dart';

class UserController {
  final UserRepository repository;
  final AuthController authController;

  UserController(this.repository, this.authController);

  final isLoading = ValueNotifier<bool>(false);

  final state = ValueNotifier<UserModel>(
    UserModel(
      matricula: 'matricula',
      nome_usual: 'nome_usual',
      cpf: 'cpf',
      rg: 'rg',
      data_nascimento: 'data_nascimento',
      naturalidade: 'naturalidade',
      tipo_sanguineo: 'tipo_sanguineo',
      email: 'email',
      photo_url: 'photo_url',
      tipo_vinculo: 'tipo_vinculo',
    ),
  );

  final ValueNotifier<String> error = ValueNotifier<String>('');

  Future getData() async {
    isLoading.value = true;

    try {
      final result = await repository.getData();
      state.value = result;
    } on NotAuthorized {
      authController.logout();
    } catch (e) {
      error.value = e.toString();
    }

    isLoading.value = false;
  }
}
