import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../controllers/conditions_controller.dart';

class PrivacyAndPolicyView extends GetView {
  PrivacyAndPolicyView({super.key});

  final ConditionsController conditionsController =
  Get.put(ConditionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.mainColor,
        title: Text(
          'privacy_and_policy'.tr, // Dynamic translation for "Privacy and Policy"
          style: appBarStyle,
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            AppImages.back,
            scale: 4,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Obx(() {
          if (conditionsController.isLoading.value) {
            return Center(
                child: CircularProgressIndicator(
                  color: AppColors.bottomBarText,
                ));
          } else if (conditionsController.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                conditionsController.errorMessage.value,
                style: h4.copyWith(fontSize: 14, color: AppColors.red),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Html(
                data: conditionsController.getPrivacyPolicy.value,
                style: {
                  "*": Style(
                    backgroundColor: AppColors.mainColor,
                  ),
                },
              ),
            );
          }
        }),
      ),
    );
  }
}
