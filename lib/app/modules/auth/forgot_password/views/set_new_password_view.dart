import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:yalla_coupon/app/modules/auth/forgot_password/views/reset_success_view.dart';
import 'package:yalla_coupon/common/widgets/custom_background_color.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_textfield.dart';

class SetNewPasswordView extends GetView {
  const SetNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgroundColor(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sh60,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      AppImages.arrowLeftBack,
                      scale: 4,
                    )),
              ),
              sh8,
              Divider(),
              sh12,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Set new password',
                      style: h2.copyWith(fontWeight: FontWeight.w700),
                    ),
                    sh12,
                    Text(
                      'Enter your new password and make sure you remember it',
                      style: h5,
                    ),
                    sh16,
                    Text(
                      'New password',
                      style: h4,
                    ),
                    sh12,
                    CustomTextField(
                      hintText: '**********',
                      sufIcon: Image.asset(
                        AppImages.eyeClose,
                        scale: 4,
                      ),
                    ),
                    sh16,
                    Text(
                      'Re-type New Password',
                      style: h4,
                    ),
                    sh12,
                    CustomTextField(
                      sufIcon: Image.asset(
                        AppImages.eyeClose,
                        scale: 4,
                      ),
                      hintText: '**********',
                    ),
                    sh16,
                    CustomButton(
                      text: 'Save changes',
                      onPressed: () {
                        Get.offAll(() => ResetSuccessView());
                      },
                      imageAssetPath: AppImages.arrowRightNormal,
                      gradientColors: AppColors.buttonColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
