import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yalla_coupon/app/modules/auth/onboarding/views/onboarding_view.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/widgets/custom_background_color.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(
        () => OnboardingView(),
        transition: Transition.rightToLeft,
        duration: Duration(milliseconds: 1200),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: CustomBackgroundColor(
        gradiantColor: AppColors.splashBackColor,
        child: Image.asset(
          AppImages.splashLogo,
          scale: 4,
        ),
      ),
    );
  }
}
