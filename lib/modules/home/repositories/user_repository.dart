import 'package:dio/dio.dart';
import 'package:suap_uenp_app/exceptions/not_authorized.dart';
import 'package:suap_uenp_app/modules/home/models/user_models.dart';

class UserRepository {
  final Dio client;

  UserRepository(this.client);

  Future<UserModel> getData() async {
    try {
      final response = await client.get(
        '/v2/minhas-informacoes/meus-dados/',
      );

      UserModel user = UserModel.fromJson(response.data);

      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw NotAuthorized(e.response?.statusMessage ?? "Não autorizado");
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }
}
