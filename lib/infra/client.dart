import 'package:dio/dio.dart';
import 'package:suap_uenp_app/config/constants.dart';

Dio createApiClient() {
  final dio = Dio(
    BaseOptions(
      baseUrl: Constants.baseUrl,
    ),
  );

  return dio;
}
