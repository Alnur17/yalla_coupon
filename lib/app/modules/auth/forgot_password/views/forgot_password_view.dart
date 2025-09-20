import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:yalla_coupon/app/modules/auth/forgot_password/views/verify_otp_view.dart';
import 'package:yalla_coupon/common/widgets/custom_background_color.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_textfield.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

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
                  'Forgot Password',
                  style: h2.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                sh12,
                Text(
                  'We will send the OTP code to your email for security in forgetting your password',
                  style: h5,
                ),
                sh30,
                Text(
                  'Email',
                  style: h4,
                ),
                sh8,
                CustomTextField(
                  hintText: 'Enter your email',
                ),
                sh30,
                CustomButton(
                  text: 'Send Code',
                  onPressed: () {
                    Get.to(() => VerifyOtpView());
                  },
                  imageAssetPath: AppImages.arrowRightNormal,
                  gradientColors: AppColors.buttonColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
