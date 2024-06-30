import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:suap_uenp_app/modules/home/models/test_model.dart';
import 'package:suap_uenp_app/modules/home/repositories/test_repository.dart';

class TestController {
  final TestRepository repository;

  TestController(this.repository);

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  final ValueNotifier<List<TestModel>> state =
      ValueNotifier<List<TestModel>>([]);

  final ValueNotifier<String> error = ValueNotifier<String>('');

  Future getTests() async {
    isLoading.value = true;

    try {
      final result = await repository.getData();
      log("print ${result.first.id}");
      state.value = result;
    } catch (e) {
      error.value = e.toString();
    }

    isLoading.value = false;
  }
}
