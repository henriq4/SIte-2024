import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:suap_uenp_app/config/constants.dart';

class ApiClient {
  final Dio client = Dio(
    BaseOptions(baseUrl: Constants.baseUrl),
  );

  String? token;

  final _storage = const FlutterSecureStorage();

  ApiClient() {
    client.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['Authorization'] = 'Bearer $token';

          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            if (await _storage.containsKey(key: 'refreshToken')) {
              if (await refreshToken()) {
                return handler.resolve(await _retry(error.requestOptions));
              }
            }
          }

          return handler.next(error);
        },
      ),
    );
  }

  Future<bool> refreshToken() async {
    final refreshToken = await _storage.read(key: 'refreshToken');

    final response = await client.post(
      '/auth/refresh-token',
      data: {
        'refreshToken': refreshToken,
      },
    );

    if (response.statusCode == 201) {
      token = response.data['token'];
      return true;
    }

    token = null;
    _storage.deleteAll();
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
