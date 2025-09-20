import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yalla_coupon/app/modules/auth/forgot_password/views/reset_success_view.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/widgets/custom_snackbar.dart';
import '../../../../data/api.dart';
import '../../../../data/base_client.dart';
import '../../login/views/login_view.dart';
import '../views/set_new_password_view.dart';
import '../views/verify_otp_view.dart';

class ForgotPasswordController extends GetxController {
  var isLoading = false.obs;
  var isResendLoading = false.obs;

  Rx<int> countdown = 59.obs;

  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController otpTEController = TextEditingController();
  final TextEditingController newPasswordTEController = TextEditingController();
  final TextEditingController confirmNewPasswordTEController =
      TextEditingController();


  @override
  void onInit() {
    super.onInit();
    startCountdown();
  }

  // Countdown timer logic
  void startCountdown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        timer.cancel();
      }
    });
  }

  Future forgotPassword({
    required String email,
  }) async {
    try {
      isLoading(true);
      var map = <String, dynamic>{};
      map['email'] = email;

      var headers = {
        'Content-Type': 'application/json',
      };
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
            api: Api.forgotPassword, body: jsonEncode(map), headers: headers),
      );

      if (responseBody != null) {
        String message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: AppColors.green);
        // countdown.value = 59;
        // startCountdown();

        // Only navigate if you’re not already on VerifyOtpView
        if (Get.currentRoute != '/VerifyOtpView') {
          Get.to(() => VerifyOtpView(isSignupVerify: false, email: email));
        }
        isLoading(false);
      } else {
        throw 'forgot in Failed!';
      }
    } catch (e) {
      debugPrint("Catch Error:::::: $e");
    } finally {
      isLoading(false);
    }
  }

  /// Otp verification
  Future verifyOtp(
      {required String email, required bool isSignupVerify}) async {
    try {
      isLoading(true);
      var map = <String, dynamic>{};
      map['email'] = email;
      map['otp'] = otpTEController.text;
      map['verifyAccount'] = isSignupVerify;

      var headers = {
        //'token': otpToken,
        'Content-Type': 'application/json',
      };
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
          api: Api.otpVerify,
          body: jsonEncode(map),
          headers: headers,
        ),
      );

      if (responseBody != null) {
        String message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: AppColors.green);
        Get.to(() => isSignupVerify ? const LoginView() : SetNewPasswordView());

        isLoading(false);
      } else {
        throw 'verify otp in Failed!';
      }
    } catch (e) {
      debugPrint("Catch Error:::::: $e");
    } finally {
      isLoading(false);
    }
  }

  Future resetPass() async {
    if (newPasswordTEController.text.trim() !=
        confirmNewPasswordTEController.text.trim()) {
      kSnackBar(message: 'Password not match', bgColor: AppColors.orange);
      return;
    }
    try {
      isLoading(true);
      var map = <String, dynamic>{};
      map['email'] = emailTEController.text.trim();
      map['password'] = newPasswordTEController.text.trim();

      var headers = {
        'Content-Type': 'application/json',
      };
      dynamic responseBody = await BaseClient.handleResponse(
        await BaseClient.postRequest(
            api: Api.resetPassword, body: jsonEncode(map), headers: headers),
      );

      if (responseBody != null) {
        String message = responseBody['message'].toString();
        kSnackBar(message: message, bgColor: AppColors.green);

        Get.offAll(() => ResetSuccessView());

        isLoading(false);
      } else {
        throw 'Failed to login!';
      }
    } catch (e) {
      debugPrint("Catch Error:::::: $e");
    } finally {
      isLoading(false);
    }
  }
}
