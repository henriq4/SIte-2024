import 'package:dio/dio.dart';
import 'package:suap_uenp_app/exceptions/not_authorized.dart';
import 'package:suap_uenp_app/modules/shared/models/academic_year_model.dart';

class AcademicYearRepository {
  final Dio client;

  AcademicYearRepository(this.client);

  Future<List<AcademicYear>> getData() async {
    try {
      final response = await client.get(
        '/v2/minhas-informacoes/meus-periodos-letivos/',
      );

      List<AcademicYear> academicYears = (response.data as List)
          .map((academicYear) => AcademicYear.fromJson(academicYear))
          .toList();

      return academicYears;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw NotAuthorized(e.response?.statusMessage ?? "Não autorizado");
      }
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<AcademicYear> getHigh() async {
    try {
      final response = await client.get(
        '/v2/minhas-informacoes/meus-periodos-letivos/',
      );

      List<AcademicYear> academicYears = (response.data as List)
          .map((academicYear) => AcademicYear.fromJson(academicYear))
          .toList();

      final currentYear = academicYears.fold<AcademicYear>(
        academicYears[0],
        (previous, current) => current.periodo_letivo > previous.periodo_letivo
            ? current
            : previous,
      );

      return currentYear;
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
