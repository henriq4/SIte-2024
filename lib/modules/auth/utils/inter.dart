import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

Dio addDioInterceptors(Dio dio, SharedPreferences sharedPreferences) {
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        final apiKey = sharedPreferences.getString('apiKey');

        if (apiKey != null) {
          options.headers['Authorization'] = 'ApiKey $apiKey';
        }

        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (error, handler) {
        return handler.next(error);
      },
    ),
  );

  return dio;
}
