import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_textfield.dart';

class EditProfileView extends GetView {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.mainColor,
        leading: Padding(
          padding: const EdgeInsets.all(12),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(
              AppImages.back,
              scale: 4,
            ),
          ),
        ),
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sh20,
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(AppImages.profileImageTwo),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          log("Camera icon tapped");
                        },
                        child: const CircleAvatar(
                          radius: 15,
                          backgroundColor: AppColors.black,
                          child: Icon(
                            Icons.camera_alt,
                            color: AppColors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              sh40,
              Text(
                'Full Name',
                style: h5,
              ),
              sh8,
              CustomTextField(
                hintText: 'Enter your Name',
              ),
              sh12,
              Text(
                'Email',
                style: h5,
              ),
              sh8,
              CustomTextField(
                hintText: 'Enter Email',
              ),
              sh12,
              Text(
                'Contact',
                style: h5,
              ),
              sh8,
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: CustomTextField(
                      hintText: 'Code',
                    ),
                  ),
                  sw5,
                  Expanded(
                    child: CustomTextField(
                      hintText: 'Your phone number',
                    ),
                  ),
                ],
              ),
              sh20,
              CustomButton(
                text: 'Save Changes',
                onPressed: () {},
                gradientColors: AppColors.buttonColor,
              ),
              sh20,
            ],
          ),
        ),
      ),
    );
  }
}
