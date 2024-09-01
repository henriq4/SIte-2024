import 'package:flutter/material.dart';
import 'package:suap_uenp_app/exceptions/not_authorized.dart';
import 'package:suap_uenp_app/modules/auth/controllers/auth_controller.dart';
import 'package:suap_uenp_app/modules/perfil/repositories/user_repository.dart';
import 'package:suap_uenp_app/modules/shared/controllers/academic_year_controller.dart';
import 'package:suap_uenp_app/modules/shared/controllers/report_controller.dart';

class HomeController {
  final UserRepository repository;
  final AuthController authController;

  final AcademicYearController academicYearController;
  final ReportController reportController;

  HomeController(
    this.repository,
    this.authController,
    this.academicYearController,
    this.reportController,
  );

  final isLoading = ValueNotifier<bool>(false);

  final state = ValueNotifier([]);

  final ValueNotifier<String> error = ValueNotifier<String>('');

  Future getData() async {
    isLoading.value = true;

    try {
      final result = await repository.getData();
      // state.value = result;
    } on NotAuthorized {
      authController.logout();
    } catch (e) {
      error.value = e.toString();
    }

    isLoading.value = false;
  }
}
