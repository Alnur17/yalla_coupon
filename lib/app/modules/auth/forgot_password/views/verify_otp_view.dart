import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:yalla_coupon/app/modules/auth/forgot_password/controllers/forgot_password_controller.dart';
import 'package:yalla_coupon/common/widgets/custom_background_color.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_loader.dart';

class VerifyOtpView extends StatefulWidget {
  final bool isSignupVerify;
  final String email;

  const VerifyOtpView({
    super.key,
    required this.isSignupVerify,
    required this.email,
  });

  @override
  State<VerifyOtpView> createState() => _VerifyOtpViewState();
}

class _VerifyOtpViewState extends State<VerifyOtpView> {
  final forgotPassController = Get.isRegistered<ForgotPasswordController>()
      ? Get.find<ForgotPasswordController>()
      : Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        scrolledUnderElevation: 0,
        title: Image.asset(
          AppImages.logoText,
          scale: 4,
        ),
        titleSpacing: 8,
        leading: Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
                AppImages.back,
                scale: 4,
              )),
        ),
      ),
      body: CustomBackgroundColor(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sh20,
                Text(
                  'otp_verification'.tr,
                  // Dynamic translation for "OTP Verification"
                  style: h2.copyWith(fontWeight: FontWeight.w700),
                ),
                sh12,
                Text(
                  'enter_otp_code'.tr,
                  // Dynamic translation for "Enter 6-digit Code"
                  style: h4,
                ),
                sh8,
                Text(
                  'otp_sent_to_email'.tr,
                  // Dynamic translation for "Your code was sent to your given email"
                  style: h5,
                ),
                const SizedBox(height: 30),
                PinCodeTextField(
                  controller: forgotPassController.otpTEController,
                  length: 6,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 60,
                    fieldWidth: 50,
                    // Reduce the width slightly for the gap
                    activeColor: AppColors.white,
                    activeFillColor: AppColors.white,
                    inactiveColor: AppColors.borderColor,
                    inactiveFillColor: AppColors.white,
                    selectedColor: AppColors.blue,
                    selectedFillColor: AppColors.white,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: AppColors.transparent,
                  cursorColor: AppColors.blue,
                  enablePinAutofill: true,
                  enableActiveFill: true,
                  onCompleted: (v) {},
                  onChanged: (value) {},
                  beforeTextPaste: (text) {
                    log("Allowing to paste $text");
                    return true;
                  },
                  appContext: context,
                ),
                sh20,
                Obx(
                  () {
                    return forgotPassController.countdown.value > 0
                        ? Text(
                            'resend_code_in'.trParams(
                                {'0': forgotPassController.countdown.value.toString()}),
                            // Dynamic translation for "Resend Code In ${countdown} s"
                            style: h3,
                          )
                        : GestureDetector(
                            onTap: forgotPassController.countdown.value == 0
                                ? () {
                                    forgotPassController.forgotPassword(
                                        email: widget.email);
                                  }
                                : null,
                            child: Text(
                              'resend_code'.tr,
                              // Dynamic translation for "Resend Code"
                              style: h4.copyWith(
                                color: AppColors.black,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.black,
                                decorationThickness: 2,
                                decorationStyle: TextDecorationStyle.dashed,
                              ),
                            ),
                          );
                  },
                ),
                sh30,
                Obx(() {
                  return forgotPassController.isLoading.value == true
                      ? CustomLoader(color: AppColors.white)
                      : CustomButton(
                          text: 'verify'.tr, // Dynamic translation for "Verify"
                          onPressed: () {
                            forgotPassController.verifyOtp(
                              email: widget.email,
                              isSignupVerify: widget.isSignupVerify,
                            );
                          },
                          imageAssetPath: AppImages.arrowRightNormal,
                          gradientColors: AppColors.buttonColor,
                        );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
