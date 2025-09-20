import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:yalla_coupon/app/modules/auth/forgot_password/controllers/forgot_password_controller.dart';
import 'package:yalla_coupon/common/widgets/custom_background_color.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_loader.dart';
import '../../../../../common/widgets/custom_textfield.dart';

class SetNewPasswordView extends StatefulWidget {
  const SetNewPasswordView({
    super.key,
  });

  @override
  State<SetNewPasswordView> createState() => _SetNewPasswordViewState();
}

class _SetNewPasswordViewState extends State<SetNewPasswordView> {
  final ForgotPasswordController forgotPasswordController = Get.find();

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
                  controller: forgotPasswordController.newPasswordTEController,
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
                  controller:
                      forgotPasswordController.confirmNewPasswordTEController,
                  sufIcon: Image.asset(
                    AppImages.eyeClose,
                    scale: 4,
                  ),
                  hintText: '**********',
                ),
                sh16,
                Obx(
                  () {
                    return forgotPasswordController.isLoading.value == true
                        ? CustomLoader(color: AppColors.white)
                        : CustomButton(
                            text: 'Save changes',
                            onPressed: () {
                              forgotPasswordController.resetPass();
                            },
                            imageAssetPath: AppImages.arrowRightNormal,
                            gradientColors: AppColors.buttonColor,
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
