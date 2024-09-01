import 'package:flutter/material.dart';
import 'package:suap_uenp_app/exceptions/not_authorized.dart';
import 'package:suap_uenp_app/modules/auth/controllers/auth_controller.dart';
import 'package:suap_uenp_app/modules/shared/models/academic_year_model.dart';
import 'package:suap_uenp_app/modules/shared/repositories/academic_year_repository.dart';

class AcademicYearController {
  final AcademicYearRepository repository;
  final AuthController authController;

  AcademicYearController(this.repository, this.authController);

  final isLoading = ValueNotifier<bool>(false);

  final stateAll = ValueNotifier<List<AcademicYear>>([]);

  final stateHigh = ValueNotifier<AcademicYear>(
    AcademicYear(ano_letivo: 0, periodo_letivo: 0),
  );

  final ValueNotifier<String> error = ValueNotifier<String>('');

  Future getData() async {
    isLoading.value = true;

    try {
      final result = await repository.getData();
      stateAll.value = result;
    } on NotAuthorized {
      authController.logout();
    } catch (e) {
      error.value = e.toString();
    }

    isLoading.value = false;
  }

  Future getHigh() async {
    isLoading.value = true;

    try {
      final result = await repository.getHigh();
      stateHigh.value = result;
    } on NotAuthorized {
      authController.logout();
    } catch (e) {
      error.value = e.toString();
    }

    isLoading.value = false;
  }
}
