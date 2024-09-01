import 'package:flutter_modular/flutter_modular.dart';
import 'package:suap_uenp_app/modules/shared/controllers/academic_year_controller.dart';
import 'package:suap_uenp_app/modules/shared/controllers/report_controller.dart';
import 'package:suap_uenp_app/modules/shared/repositories/academic_year_repository.dart';
import 'package:suap_uenp_app/modules/shared/repositories/report_repository.dart';

class SharedModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => AcademicYearRepository(i()), export: true),
        Bind.lazySingleton(
          (i) => AcademicYearController(i(), i()),
          export: true,
        ),
        Bind.lazySingleton((i) => ReportRepository(i()), export: true),
        Bind.lazySingleton(
          (i) => ReportController(i(), i()),
          export: true,
        ),
      ];
}
