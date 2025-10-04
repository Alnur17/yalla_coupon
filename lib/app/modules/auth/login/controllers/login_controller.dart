import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_constant/app_constant.dart';
import '../../../../../common/helper/auth_sevices.dart';
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
  final AuthService _authService = AuthService(); // Instance of AuthService

  @override
  void onClose() {
    emailTEController.dispose();
    passwordTEController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  /// ---------------------------
  /// EMAIL / PASSWORD LOGIN
  /// ---------------------------
  Future<void> userLogin() async {
    if (emailTEController.text.trim().isEmpty) {
      kSnackBar(message: 'Please enter a valid email', bgColor: AppColors.orange);
      return;
    }
    if (passwordTEController.text.trim().isEmpty ||
        passwordTEController.text.length < 6) {
      kSnackBar(message: 'Password must be at least 6 characters', bgColor: AppColors.orange);
      return;
    }

    try {
      isLoading.value = true;

      final fcmToken = LocalStorage.getData(key: AppConstant.fcmToken);

      var body = {
        'email': emailTEController.text.trim(),
        'password': passwordTEController.text.trim(),
        'fcmToken': fcmToken,
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

        kSnackBar(
          message: result['message'] ?? 'Login successful!',
          bgColor: AppColors.green,
        );
        Get.offAll(() => DashboardView());
      } else {
        kSnackBar(message: result['message'], bgColor: AppColors.red);
      }
    } catch (e) {
      kSnackBar(message: e.toString(), bgColor: AppColors.orange);
    } finally {
      isLoading.value = false;
    }
  }

  /// ---------------------------
  /// GOOGLE LOGIN
  /// ---------------------------
  Future<void> signInWithGoogle() async {
    try {
      isLoading.value = true;

      final userCredential = await _authService.signInWithGoogle();

      if (userCredential != null) {
        final idToken = await userCredential.user?.getIdToken(true);
        print('idToken from controller: $idToken');

        final map = {"idToken": idToken};

        if (idToken != null) {
          final response = await BaseClient.postRequest(
            api: Api.googleLogin,
            body: jsonEncode(map),
            headers: {"Content-Type": "application/json"},
          );

          final result = await BaseClient.handleResponse(response);

          if (result != null) {
            final String token = result['data']['accessToken'].toString();
            LocalStorage.saveData(key: AppConstant.token, data: token);

            kSnackBar(
              message: 'Google login successful!',
              bgColor: AppColors.green,
            );
            Get.offAll(() => DashboardView());
          }
        }
      } else {
        kSnackBar(message: 'Google login cancelled or failed', bgColor: AppColors.orange);
      }
    } catch (e) {
      kSnackBar(message: 'Google login error: $e', bgColor: AppColors.red);
    } finally {
      isLoading.value = false;
    }
  }

  /// ---------------------------
  /// FACEBOOK LOGIN
  /// ---------------------------
  Future<void> signInWithFacebook() async {
    try {
      isLoading.value = true;

      final userCredential = await _authService.signInWithFacebook();
      if (userCredential != null) {
        final idToken = await userCredential.user?.getIdToken(true);

        if (idToken != null) {
          final response = await BaseClient.postRequest(
            api: Api.googleLogin,
            body: jsonEncode({"idToken": idToken}),
            headers: {"Content-Type": "application/json"},
          );

          final result = await BaseClient.handleResponse(response);

          if (result != null) {
            final String token = result['data']['accessToken'].toString();
            LocalStorage.saveData(key: AppConstant.token, data: token);

            kSnackBar(
              message: 'Facebook login successful!',
              bgColor: AppColors.green,
            );
            Get.offAll(() => DashboardView());
          }
        }
      } else {
        kSnackBar(message: 'Facebook login cancelled or failed', bgColor: AppColors.orange);
      }
    } catch (e) {
      kSnackBar(message: 'Facebook login error: $e', bgColor: AppColors.red);
    } finally {
      isLoading.value = false;
    }
  }

  /// ---------------------------
  /// APPLE LOGIN
  /// ---------------------------
  Future<void> signInWithApple() async {
    try {
      isLoading.value = true;

      final userCredential = await _authService.signInWithApple();
      if (userCredential != null) {
        final idToken = await userCredential.user?.getIdToken(true);

        if (idToken != null) {
          final response = await BaseClient.postRequest(
            api: Api.googleLogin,
            body: jsonEncode({"idToken": idToken}),
            headers: {"Content-Type": "application/json"},
          );

          final result = await BaseClient.handleResponse(response);

          if (result != null) {
            final String token = result['data']['accessToken'].toString();
            LocalStorage.saveData(key: AppConstant.token, data: token);

            kSnackBar(
              message: 'Apple login successful!',
              bgColor: AppColors.green,
            );
            Get.offAll(() => DashboardView());
          }
        }
      } else {
        kSnackBar(message: 'Apple login cancelled or failed', bgColor: AppColors.orange);
      }
    } catch (e) {
      kSnackBar(message: 'Apple login error: $e', bgColor: AppColors.red);
    } finally {
      isLoading.value = false;
    }
  }
}
