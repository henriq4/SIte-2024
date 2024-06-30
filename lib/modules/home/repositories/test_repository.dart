import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:suap_uenp_app/modules/home/models/test_model.dart';

class TestRepository {
  final Dio client;

  TestRepository(this.client);

  Future<List<TestModel>> getData() async {
    final response = await client.get(
      '/breeds',
    );

    print(response);

    if (response.statusCode == 200) {
      final List<TestModel> tests = [];

      final body = jsonDecode(response.data);

      body['data'].map((item) {
        final TestModel test = TestModel.fromMap(item);
        tests.add(test);
      }).toList();

      return tests;
    } else if (response.statusCode == 404) {
      throw Exception('A url informada não é válida');
    } else {
      throw Exception('Não foi possível carregar os Tests');
    }
  }
}
