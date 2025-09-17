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
import '../../../profile/controllers/language_controller.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final LanguageController languageController = Get.put(LanguageController());

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
                Obx(() => CustomListTile(
                  leadingImage: AppImages.languageTwo,
                  title: 'English',
                  onTap: () => languageController.selectLanguage('English'),
                  trailingImage: languageController.selectedLanguage.value == 'English'
                      ? AppImages.checkBoxFilled
                      : AppImages.checkBox,
                  containerColor: AppColors.transparent,
                  borderColor: languageController.selectedLanguage.value == 'English'
                      ? AppColors.bottomBarText
                      : AppColors.borderColor,
                )),

                sh12,

                Obx(() => CustomListTile(
                  leadingImage: AppImages.languageTwo,
                  title: 'Arabic',
                  onTap: () => languageController.selectLanguage('Arabic'),
                  trailingImage: languageController.selectedLanguage.value == 'Arabic'
                      ? AppImages.checkBoxFilled
                      : AppImages.checkBox,
                  containerColor: AppColors.transparent,
                  borderColor: languageController.selectedLanguage.value == 'Arabic'
                      ? AppColors.bottomBarText
                      : AppColors.borderColor,
                )),
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
