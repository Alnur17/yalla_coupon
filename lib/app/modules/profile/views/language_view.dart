import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:yalla_coupon/app/modules/profile/controllers/language_controller.dart';
import 'package:yalla_coupon/common/widgets/custom_list_tile.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/custom_circular_container.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text(
          'Languages',
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
            Center(
                child: Image.asset(
              AppImages.language,
              scale: 4,
            )),
            sh30,
            Text(
              'Select Language',
              style: h3,
            ),
            sh8,
            Text(
              'Choose your preferred language to continue',
              style: h5,
            ),
            sh12,
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
            sh30,
            CustomButton(
              text: 'Save Changes',
              onPressed: () {},
              gradientColors: AppColors.buttonColor,
            ),
          ],
        ),
      ),
    );
  }
}
