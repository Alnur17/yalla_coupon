import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yalla_coupon/app/modules/auth/forgot_password/views/verify_otp_view.dart';

import '../../../../data/api.dart';
import '../../../../data/base_client.dart';

class SignUpController extends GetxController {
  var isLoading = false.obs;
  var isCheckboxVisible = false.obs;
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  final TextEditingController phoneTEController = TextEditingController();
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
  final TextEditingController confirmPassTEController = TextEditingController();

  void toggleCheckboxVisibility() {
    isCheckboxVisible.toggle();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.toggle();
  }

  Future<void> registerUser() async {
    try {
      isLoading(true);

      if (passwordTEController.text.trim().length < 6) {
        Get.snackbar('Error', 'Confirm Password must be at least 6 characters');
        return;
      }

      if (passwordTEController.text.trim() !=
          confirmPassTEController.text.trim()) {
        Get.snackbar('Error', 'Passwords do not match');
        return;
      }

      final body = {
        "phone": phoneTEController.text.trim(),
        "country": "bangladesh",
        "email": emailTEController.text.trim(),
        "password": passwordTEController.text.trim(),
      };

      final header = {
        "Content-Type": "application/json",
      };

      final response = await BaseClient.postRequest(
        api: Api.register,
        body: jsonEncode(body),
        headers: header,
      );

      final data = await BaseClient.handleResponse(response);
      debugPrint('Response data: $data');

      if (data != null && data['success'] == true) {
        Get.to(() => VerifyOtpView(isSignupVerify: true,email: emailTEController.text.trim(),));
      } else {
        Get.snackbar('Error', data?['message'] ?? 'Failed to signup');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
