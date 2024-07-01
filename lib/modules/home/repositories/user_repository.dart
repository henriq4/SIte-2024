import 'package:dio/dio.dart';
import 'package:suap_uenp_app/modules/home/models/user_models.dart';

class UserRepository {
  final Dio client;

  UserRepository(this.client);

  Future<UserModel> getData() async {
    final response = await client.get(
      '/v2/minhas-informacoes/meus-dados/',
    );

    if (response.statusCode == 200) {
      UserModel user = UserModel.fromJson(response.data);

      return user;
    } else if (response.statusCode == 404) {
      throw Exception('A url informada não é válida');
    } else {
      throw Exception('Não foi possível carregar os dados');
    }
  }
}
