import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../login/views/login_view.dart';

class ResetSuccessView extends GetView {
  const ResetSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.verifySuccess,
              scale: 4,
            ),
            sh20,
            Text(
              'success'.tr, // Dynamic translation for "Success"
              style: h2,
            ),
            sh5,
            Text(
              'password_reset_success'.tr, // Dynamic translation for "Your password has been successfully reset"
              style: h3.copyWith(
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            sh20,
            CustomButton(
              text: 'back_to_login'.tr, // Dynamic translation for "Back to Log In"
              onPressed: () {
                Get.offAll(()=> LoginView());
              },
              borderColor: AppColors.bottomBarText,
              textStyle: h3.copyWith(color: AppColors.bottomBarText),
              //gradientColors: AppColors.buttonColor,
            ),
          ],
        ),
      ),
    );
  }
}
