import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:yalla_coupon/app/modules/auth/sign_up/views/sign_up_view.dart';
import 'package:yalla_coupon/common/app_color/app_colors.dart';
import 'package:yalla_coupon/common/app_images/app_images.dart';
import 'package:yalla_coupon/common/app_text_style/styles.dart';
import 'package:yalla_coupon/common/localization/localization_controller.dart';
import 'package:yalla_coupon/common/size_box/custom_sizebox.dart';
import 'package:yalla_coupon/common/widgets/custom_background_color.dart';
import 'package:yalla_coupon/common/widgets/custom_button.dart';

import '../../../../../common/app_constant/app_constant.dart';
import '../../../../../common/helper/local_store.dart';
import '../../../../../common/widgets/custom_list_tile.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final LocalizationController localizationController = Get.put(LocalizationController());

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
                  'select_language'.tr, // Using dynamic translation for "Select Language"
                  style: h3,
                ),
                sh8,
                Obx(() => CustomListTile(
                  leadingImage: AppImages.languageTwo,
                  title: 'English', // Static "English" text
                  onTap: () => localizationController.changeLanguage('English'),
                  trailingImage: localizationController.selectedLanguage.value == 'English'
                      ? AppImages.checkBoxFilled
                      : AppImages.checkBox,
                  containerColor: AppColors.transparent,
                  borderColor: localizationController.selectedLanguage.value == 'English'
                      ? AppColors.bottomBarText
                      : AppColors.borderColor,
                )),

                sh12,

                Obx(() => CustomListTile(
                  leadingImage: AppImages.languageTwo,
                  title: 'Arabic', // Static "Arabic" text
                  onTap: () => localizationController.changeLanguage('Arabic'),
                  trailingImage: localizationController.selectedLanguage.value == 'Arabic'
                      ? AppImages.checkBoxFilled
                      : AppImages.checkBox,
                  containerColor: AppColors.transparent,
                  borderColor: localizationController.selectedLanguage.value == 'Arabic'
                      ? AppColors.bottomBarText
                      : AppColors.borderColor,
                )),
                sh16,
                CustomButton(
                  text: 'next'.tr, // Using dynamic translation for "Next"
                  onPressed: () {
                    LocalStorage.saveData(key: AppConstant.onboardingDone, data: "onboardingDone");
                    Get.to(() => SignUpView());
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
