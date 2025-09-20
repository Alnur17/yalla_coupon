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
import '../../../../../common/widgets/custom_textfield.dart';
import '../../login/views/login_view.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

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
                  'Join us & Make Use of The best Available Discounts',
                  style: h4,
                ),
                sh24,
                Text('Phone', style: h4),
                sh8,
                IntlPhoneField(
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
                  initialCountryCode: 'BD',
                  onChanged: (phone) {
                    log(phone.completeNumber);
                  },
                ),
                Text('Email', style: h4),
                sh8,
                CustomTextField(
                  hintText: 'Your email',
                  containerColor: AppColors.white,
                ),
                sh12,
                Text('Password', style: h4),
                sh8,
                CustomTextField(
                  sufIcon: Image.asset(
                    AppImages.eyeClose,
                    scale: 4,
                  ),
                  hintText: '**********',
                  containerColor: AppColors.white,
                ),
                sh12,
                Text('Confirm Password', style: h4),
                sh8,
                CustomTextField(
                  sufIcon: Image.asset(
                    AppImages.eyeClose,
                    scale: 4,
                  ),
                  hintText: '**********',
                  containerColor: AppColors.white,
                ),
                sh24,
                // Obx(
                //       () {
                //     return loginController.isLoading.value == true
                //         ? CustomLoader(color: AppColors.white)
                //         :
                CustomButton(
                  text: 'Sign Up',
                  onPressed: () {
                    Get.to(()=> DashboardView());
                    // loginController.userLogin(
                    //   email: emailTEController.text,
                    //   password: passwordTEController.text,
                    // );
                  },
                  imageAssetPath: AppImages.arrowRightNormal,
                  gradientColors: AppColors.buttonColor,
                  //   );
                  // },
                ),
                sh12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(child: Divider()),
                    sw10,
                    Text(
                      'Or sign in with',
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
                    'Already have an Account? ',
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
                        'Sign In Now',
                        style: h4.copyWith(
                          color: AppColors.bottomBarText,
                        ),
                      ),
                    ),
                    sw20,
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Maybe Later',
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
