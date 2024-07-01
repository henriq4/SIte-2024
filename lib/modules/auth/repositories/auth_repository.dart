import 'package:dio/dio.dart';
import 'package:suap_uenp_app/modules/auth/models/login_model.dart';

class AuthRepository {
  final Dio client;

  AuthRepository(this.client);

  Future<LoginModel> login() async {
    try {
      final response = await client.post(
        '/v2/autenticacao/token/',
        data: {'username': '202211113030003', 'password': '!HEl7&m*c'},
        cancelToken: CancelToken(),
      );

      LoginModel login = LoginModel.fromJson(response.data);

      return login;
    } on DioException catch (e) {
      print(e.response?.requestOptions.headers);
      throw Exception(e);
    } catch (e) {
      throw Exception();
    }
  }
}
