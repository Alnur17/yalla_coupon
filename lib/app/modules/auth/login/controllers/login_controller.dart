import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_constant/app_constant.dart';
import '../../../../../common/helper/local_store.dart';
import '../../../../../common/widgets/custom_snackbar.dart';
import '../../../../data/api.dart';
import '../../../../data/base_client.dart';
import '../../../dashboard/views/dashboard_view.dart';

class LoginController extends GetxController {
  var isPasswordVisible = false.obs;
  var isLoading = false.obs;

  final emailTEController = TextEditingController();
  final passwordTEController = TextEditingController();

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  Future<void> userLogin() async {
    if (emailTEController.text.trim().isEmpty) {
      kSnackBar(
          message: 'Please enter a valid email', bgColor: AppColors.orange);
      return;
    }
    if (passwordTEController.text.trim().isEmpty ||
        passwordTEController.text.length < 6) {
      kSnackBar(
          message: 'Password must be at least 6 characters',
          bgColor: AppColors.orange);
      return;
    }

    try {
      isLoading.value = true;

      var body = {
        'email': emailTEController.text.trim(),
        'password': passwordTEController.text.trim(),
      };

      var headers = {
        'Content-Type': 'application/json',
      };

      final response = await BaseClient.postRequest(
        api: Api.login,
        body: jsonEncode(body),
        headers: headers,
      );

      final result = await BaseClient.handleResponse(response);

      if (result != null) {
        final String token = result['data']['accessToken'].toString();
        LocalStorage.saveData(key: AppConstant.token, data: token);
        String accessToken = LocalStorage.getData(key: AppConstant.token);
        debugPrint(accessToken);
        kSnackBar(
          message: result['message'] ?? 'Login successful!',
          bgColor: AppColors.green,
        );

        Get.offAll(() => DashboardView());
      } else {
        kSnackBar(message: result['message'], bgColor: AppColors.red);
      }
    } catch (e) {
      kSnackBar(
        message: e.toString(),
        bgColor: AppColors.orange,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
