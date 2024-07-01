import 'package:dio/dio.dart';
import 'package:suap_uenp_app/modules/home/models/test_model.dart';

class TestRepository {
  final Dio client;

  TestRepository(this.client);

  Future<List<TestModel>> getData() async {
    final response = await client.get(
      '/breeds',
    );

    if (response.statusCode == 200) {
      List<TestModel> breeds = (response.data['data'] as List)
          .map((item) => TestModel.fromJson(item))
          .toList();

      return breeds;
    } else if (response.statusCode == 404) {
      throw Exception('A url informada não é válida');
    } else {
      throw Exception('Não foi possível carregar os Tests');
    }
  }
}
