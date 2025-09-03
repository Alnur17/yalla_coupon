import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:yalla_coupon/app/modules/auth/login/views/login_view.dart';
import 'package:yalla_coupon/app/modules/auth/sign_up/views/sign_up_view.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_background_color.dart';
import '../../../../../common/widgets/custom_button.dart';

class OnboardingTwoView extends GetView {
  const OnboardingTwoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgroundColor(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sh60,
                Image.asset(
                  AppImages.logoText,
                  scale: 4,
                ),
                sh87,
                Text('Let\’s Get You the Right Deals!', style: h1),
                sh12,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: Image.asset(
                        AppImages.arrowRightBig,
                        scale: 4,
                      ),
                    ),
                    sw5,
                    Expanded(
                      child: Text(
                        'Choose your preferred language so we can personalize your experience and deliver the hottest deals in your own words — wherever you are.',
                        style: h3.copyWith(
                          color: AppColors.black100,
                        ),
                      ),
                    ),
                  ],
                ),
                sh20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    sw12,
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
                    sw16,
                    Expanded(
                      child: CustomButton(
                        text: 'Open Account',
                        onPressed: () {
                          Get.to(
                            () => SignUpView(),
                            transition: Transition.fadeIn,
                          );
                        },
                        gradientColors: AppColors.buttonColor,
                      ),
                    ),
                  ],
                ),
                sh20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an accounts?',
                      style: h5.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    sw8,
                    GestureDetector(
                      onTap: () {
                        // LocalStorage.saveData(key: AppConstant.onboardingDone, data: "onboardingDone");
                        Get.to(() => LoginView());
                      },
                      child: Text(
                        'Sign in',
                        style: h5.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
