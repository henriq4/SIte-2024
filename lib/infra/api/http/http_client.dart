import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suap_uenp_app/config/constants.dart';

class ApiClient {
  final storage;

  final Dio client = Dio(
    BaseOptions(baseUrl: Constants.baseUrl),
  );

  ApiClient(this.storage) {
    client.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (options.cancelToken == null) {
            var token = Modular.get<SharedPreferences>().getString('token');
            options.headers['Authorization'] = 'Bearer $token';
          }

          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            print("dsads ${error.requestOptions.headers}");
          }

          return handler.next(error);
        },
      ),
    );
  }

  Dio createApiClient() {
    return client;
  }

  Future<bool> refreshToken(SharedPreferences storage) async {
    final refreshToken = storage.getString('refreshToken');

    final response = await client.post(
      '/auth/refresh-token',
      data: {
        'refreshToken': refreshToken,
      },
    );

    if (response.statusCode == 201) {
      // token = response.data['token'];
      return true;
    }

    storage.remove('token');
    storage.remove('refreshToken');

    return false;
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    return client.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        method: requestOptions.method,
        headers: requestOptions.headers,
      ),
    );
  }
}
