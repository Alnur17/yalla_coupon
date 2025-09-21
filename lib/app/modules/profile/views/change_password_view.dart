import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:yalla_coupon/app/modules/profile/controllers/change_password_controller.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_circular_container.dart';
import '../../../../../common/widgets/custom_textfield.dart';
import '../../../../common/widgets/custom_loader.dart';

class ChangePasswordView extends GetView {
  ChangePasswordView({super.key});

  final ChangePasswordController changePasswordController =
      Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text(
          'Change Password',
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: CustomCircularContainer(
            imagePath: AppImages.back,
            onTap: () {
              Get.back();
            },
            padding: 2,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sh16,
            Text(
              'Current password',
              style: h4,
            ),
            sh12,
            CustomTextField(
              controller: changePasswordController.currentPassTEController,
              hintText: '**********',
              sufIcon: Image.asset(
                AppImages.eyeClose,
                scale: 4,
              ),
            ),
            sh16,
            Text(
              'New Password',
              style: h4,
            ),
            sh12,
            CustomTextField(
              controller: changePasswordController.newPassTEController,
              sufIcon: Image.asset(
                AppImages.eyeClose,
                scale: 4,
              ),
              hintText: '**********',
            ),
            sh16,
            Text(
              'Confirm New Password',
              style: h4,
            ),
            sh12,
            CustomTextField(
              controller: changePasswordController.confirmPassTEController,
              sufIcon: Image.asset(
                AppImages.eyeClose,
                scale: 4,
              ),
              hintText: '**********',
            ),
            sh30,
            Obx(
              () => changePasswordController.isLoading.value == true
                  ? CustomLoader(
                      color: AppColors.white,
                    )
                  : CustomButton(
                      // imageAssetPath: AppImages.arrowFlyWhite,
                      text: "Save",
                      gradientColors: AppColors.buttonColor,
                      //backgroundColor: AppColors.textColorBlue,
                      onPressed: () {
                        changePasswordController.changePassword(
                          context: context,
                        );
                      },
                    ),
            ),
            // Center(
            //   child: CustomContainer(
            //     text: 'Update Password',
            //     imagePath: AppImages.arrowFlyWhite,
            //     onTap: () {},
            //     height: 35,
            //     width: 170,
            //     backgroundColor: AppColors.textColorBlue,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
