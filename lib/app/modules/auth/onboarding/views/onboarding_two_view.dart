import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

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
      // appBar: AppBar(
      //   title: Image.asset(AppImages.logoText,scale: 4,),
      //   //centerTitle: true,
      //   automaticallyImplyLeading: false,
      // ),
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
                sh16,
                CustomButton(
                  text: 'Next',
                  onPressed: () {},
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
