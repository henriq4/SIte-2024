import 'package:dio/dio.dart';
import 'package:suap_uenp_app/exceptions/not_authorized.dart';
import 'package:suap_uenp_app/modules/shared/dtos/report_dto.dart';
import 'package:suap_uenp_app/modules/shared/models/report_model.dart';

class ReportRepository {
  final Dio client;

  ReportRepository(this.client);

  Future<List<ReportModel>> getData(ReportDTO dto) async {
    try {
      final response = await client.get(
        '/v2/minhas-informacoes/boletim/${dto.year}/${dto.period}/',
      );

      List<ReportModel> reportModels = (response.data as List)
          .map((reportModel) => ReportModel.fromJson(reportModel))
          .toList();

      return reportModels;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw NotAuthorized(e.response?.statusMessage ?? "Não autorizado");
      }
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}
