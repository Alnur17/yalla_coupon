import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:yalla_coupon/common/widgets/custom_list_tile.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/custom_circular_container.dart';

class LanguageView extends GetView {
  const LanguageView({super.key});

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
            CustomListTile(
              leadingImage: AppImages.accountInfo,
              title: 'English',
              onTap: () {},
              trailingImage: AppImages.checkBoxFilled,
              containerColor: AppColors.transparent,
              borderColor: AppColors.bottomBarText,
            ),sh12,
            CustomListTile(
              leadingImage: AppImages.accountInfo,
              title: 'Arabic',
              onTap: () {},
              trailingImage: AppImages.checkBox,
              containerColor: AppColors.transparent,
            ),
            // Center(
            //   child: ToggleButtons(
            //     borderRadius: BorderRadius.circular(20),
            //     selectedBorderColor: AppColors.buttonColor[0],
            //     selectedColor: Colors.white,
            //     fillColor: AppColors.buttonColor[0],
            //     color: AppColors.buttonColor[0].withOpacity(0.5),
            //     borderColor: AppColors.buttonColor[0].withOpacity(0.5),
            //     splashColor: AppColors.buttonColor[0].withOpacity(0.3),
            //     children: [
            //       Padding(
            //         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            //         child: Row(
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             Image.asset(
            //               AppImages.accountInfo, // Replace with actual English flag asset
            //               width: 24.w,
            //               height: 24.w,
            //             ),
            //             SizedBox(width: 8.w),
            //             Text('English', style: h5),
            //           ],
            //         ),
            //       ),
            //       Padding(
            //         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            //         child: Row(
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             Image.asset(
            //               AppImages.accountInfo, // Replace with actual Arabic flag asset
            //               width: 24.w,
            //               height: 24.w,
            //             ),
            //             SizedBox(width: 8.w),
            //             Text('Arabic', style: h5),
            //           ],
            //         ),
            //       ),
            //     ],
            //     onPressed: (int index) {
            //       // Handle toggle selection (single selection logic)
            //     },
            //     isSelected: [true, false], // Initial selection (English by default)
            //   ),
            // ),
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
