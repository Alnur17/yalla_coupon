import 'dart:developer';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:yalla_coupon/common/app_color/app_colors.dart';
import 'package:yalla_coupon/common/app_images/app_images.dart';
import 'package:yalla_coupon/common/app_text_style/styles.dart';
import 'package:yalla_coupon/common/size_box/custom_sizebox.dart';
import 'package:yalla_coupon/common/widgets/custom_background_color.dart';
import 'package:yalla_coupon/common/widgets/custom_button.dart';
import 'package:yalla_coupon/common/widgets/custom_textfield.dart';

import '../controllers/onboarding_controller.dart';
import 'onboarding_two_view.dart';

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
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        showPhoneCode: false,
                        onSelect: (Country country) {
                          controller.selectedCountry.value = country.name;
                        },
                      );
                    },
                    child: AbsorbPointer(
                      child: CustomTextField(
                        containerColor: AppColors.white,
                        hintText: 'Select your country',
                        controller: TextEditingController(
                          text: controller.selectedCountry.value,
                        ),
                        // suffixIcon: const Icon(Icons.arrow_drop_down),
                      ),
                    ),
                  ),
                ),
                sh12,
                IntlPhoneField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    fillColor: AppColors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: AppColors.borderColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: AppColors.black),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: AppColors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: AppColors.red),
                    ),
                  ),
                  initialCountryCode: 'BD',
                  onChanged: (phone) {
                    log(phone.completeNumber);
                  },
                ),
                sh16,
                CustomButton(
                  text: 'Next',
                  onPressed: () {
                    Get.to(()=> OnboardingTwoView(),transition: Transition.rightToLeft,
                      duration: Duration(milliseconds: 1200),);
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
