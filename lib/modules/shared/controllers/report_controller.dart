import 'package:flutter/material.dart';
import 'package:suap_uenp_app/exceptions/not_authorized.dart';
import 'package:suap_uenp_app/modules/auth/controllers/auth_controller.dart';
import 'package:suap_uenp_app/modules/shared/dtos/report_dto.dart';
import 'package:suap_uenp_app/modules/shared/models/report_model.dart';
import 'package:suap_uenp_app/modules/shared/repositories/report_repository.dart';

class ReportController {
  final ReportRepository repository;
  final AuthController authController;

  ReportController(this.repository, this.authController);

  final isLoading = ValueNotifier<bool>(false);

  final stateAll = ValueNotifier<List<ReportModel>>([]);

  final ValueNotifier<String> error = ValueNotifier<String>('');

  Future getData(ReportDTO dto) async {
    isLoading.value = true;

    try {
      final result = await repository.getData(dto);
      // stateAll.value = result;
    } on NotAuthorized {
      authController.logout();
    } catch (e) {
      error.value = e.toString();
    }

    isLoading.value = false;
  }
}
