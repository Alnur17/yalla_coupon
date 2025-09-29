import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:yalla_coupon/app/modules/dashboard/views/dashboard_view.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_background_color.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_loader.dart';
import '../../../../../common/widgets/custom_textfield.dart';
import '../../login/views/login_view.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final SignUpController signUpController = Get.put(SignUpController());

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
                sh16,
                Text(
                  'join_us'.tr,
                  // Use dynamic translation for "Join us & Make Use of The best Available Discounts"
                  style: h4,
                ),
                sh24,
                Text('phone'.tr, style: h4),
                // Use dynamic translation for "Phone"
                sh8,
                Obx(
                  () {
                    if (signUpController.countryCode.value.isEmpty) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.bottomBarText,
                        ),
                      ); // loading
                    }

                    return IntlPhoneField(
                      controller: signUpController.phoneTEController,
                      initialCountryCode:
                          signUpController.countryCode.value.toUpperCase(),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        fillColor: AppColors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: AppColors.borderColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: AppColors.black),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: AppColors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: AppColors.red),
                        ),
                      ),
                      onChanged: (phone) {
                        log(phone.completeNumber);
                      },
                    );
                  },
                ),
                Text('email'.tr, style: h4),
                // Use dynamic translation for "Email"
                sh8,
                CustomTextField(
                  controller: signUpController.emailTEController,
                  hintText: 'your_email'.tr,
                  // Use dynamic translation for "Your email"
                  containerColor: AppColors.white,
                ),
                sh12,
                Text('password'.tr, style: h4),
                // Use dynamic translation for "Password"
                sh8,
                Obx(() {
                  return CustomTextField(
                    controller: signUpController.passwordTEController,
                    sufIcon: GestureDetector(
                      onTap: () {
                        signUpController.togglePasswordVisibility();
                      },
                      child: Image.asset(
                        signUpController.isPasswordVisible.value
                            ? AppImages.eyeOpen
                            : AppImages.eyeClose,
                        scale: 4,
                      ),
                    ),
                    obscureText: !signUpController.isPasswordVisible.value,
                    hintText: '**********',
                    containerColor: AppColors.white,
                  );
                }),
                sh12,
                Text('confirm_password'.tr, style: h4),
                // Use dynamic translation for "Confirm Password"
                sh8,
                Obx(() {
                  return CustomTextField(
                    controller: signUpController.confirmPassTEController,
                    sufIcon: GestureDetector(
                      onTap: () {
                        signUpController.toggleConfirmPasswordVisibility();
                      },
                      child: Image.asset(
                        signUpController.isConfirmPasswordVisible.value
                            ? AppImages.eyeOpen
                            : AppImages.eyeClose,
                        scale: 4,
                      ),
                    ),
                    obscureText:
                        !signUpController.isConfirmPasswordVisible.value,
                    hintText: '**********',
                    containerColor: AppColors.white,
                  );
                }),
                sh24,
                Obx(() {
                  return signUpController.isLoading.value == true
                      ? CustomLoader(color: AppColors.white)
                      : CustomButton(
                          text: 'sign_up'.tr,
                          // Use dynamic translation for "Sign Up"
                          onPressed: () {
                            signUpController.registerUser();
                          },
                          imageAssetPath: AppImages.arrowRightNormal,
                          gradientColors: AppColors.buttonColor,
                        );
                }),
                sh12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(child: Divider()),
                    sw10,
                    Text(
                      'or_sign_in'.tr,
                      // Use dynamic translation for "Or sign in with"
                      style: h4.copyWith(color: AppColors.grey),
                    ),
                    sw10,
                    const Expanded(child: Divider()),
                  ],
                ),
                sh20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: AppColors.white,
                        ),
                        child: Image.asset(
                          AppImages.google,
                          scale: 4,
                        ),
                      ),
                    ),
                    sw16,
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: AppColors.white,
                        ),
                        child: Image.asset(
                          AppImages.apple,
                          scale: 4,
                        ),
                      ),
                    ),
                    sw16,
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: ShapeDecoration(
                          shape: CircleBorder(),
                          color: AppColors.white,
                        ),
                        child: Image.asset(
                          AppImages.facebook,
                          scale: 4,
                        ),
                      ),
                    ),
                  ],
                ),
                sh8,
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'already_have_account'.tr,
                    // Use dynamic translation for "Already have an Account?"
                    style: h3,
                  ),
                ),
                sh12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          () => const LoginView(),
                          transition: Transition.fadeIn,
                          duration: Duration(milliseconds: 500),
                        );
                      },
                      child: Text(
                        'sign_in_now'.tr,
                        // Use dynamic translation for "Sign In Now"
                        style: h4.copyWith(
                          color: AppColors.bottomBarText,
                        ),
                      ),
                    ),
                    sw20,
                    GestureDetector(
                      onTap: () {
                        Get.offAll(() => DashboardView());
                      },
                      child: Text(
                        'maybe_later'.tr,
                        // Use dynamic translation for "Maybe Later"
                        style: h4.copyWith(
                          color: AppColors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                sh30,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
