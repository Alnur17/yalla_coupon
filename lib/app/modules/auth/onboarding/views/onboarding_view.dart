import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:yalla_coupon/app/modules/auth/sign_up/views/sign_up_view.dart';
import 'package:yalla_coupon/common/app_color/app_colors.dart';
import 'package:yalla_coupon/common/app_images/app_images.dart';
import 'package:yalla_coupon/common/app_text_style/styles.dart';
import 'package:yalla_coupon/common/size_box/custom_sizebox.dart';
import 'package:yalla_coupon/common/widgets/custom_background_color.dart';
import 'package:yalla_coupon/common/widgets/custom_button.dart';

import '../../../../../common/widgets/custom_list_tile.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final controller = Get.put(OnboardingController());

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
                sh116,
                Text(
                  'Select Language',
                  style: h3,
                ),
                sh8,
                CustomListTile(
                  leadingImage: AppImages.languageTwo,
                  title: 'English',
                  onTap: () {},
                  trailingImage: AppImages.checkBoxFilled,
                  containerColor: AppColors.white,
                  borderColor: AppColors.bottomBarText,
                ),
                sh12,
                CustomListTile(
                  leadingImage: AppImages.languageTwo,
                  title: 'Arabic',
                  onTap: () {},
                  trailingImage: AppImages.checkBox,
                  containerColor: AppColors.white,
                ),
                sh16,
                CustomButton(
                  text: 'Next',
                  onPressed: () {
                    Get.to(() => SignUpView());
                    // Get.to(
                    //   () => OnboardingTwoView(),
                    //   transition: Transition.rightToLeft,
                    //   duration: Duration(milliseconds: 1200),
                    //);
                  },
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
