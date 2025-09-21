import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:yalla_coupon/common/widgets/custom_button.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/custom_circular_container.dart';
import '../../../../common/widgets/custom_textfield.dart';
import '../controllers/contact_us_controller.dart';

class ContactUsView extends GetView {
  ContactUsView({super.key});

  final ContactUsController c = Get.put(ContactUsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text(
          'Contact Us',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sh12,
              Text(
                'Get in Touch',
                style: h3,
              ),
              sh5,
              Text(
                'We\'d love to hear from you!',
                style: h5.copyWith(color: AppColors.greyMedium),
              ),
              sh20,
              Text('Name', style: h4),
              sh8,
              CustomTextField(
                controller: c.nameController,
                borderRadius: 12,
                hintText: 'Enter your name',
                containerColor: AppColors.white,
              ),
              sh20,
              Text('Email Address', style: h4),
              sh8,
              CustomTextField(
                controller: c.emailController,
                borderRadius: 12,
                hintText: 'Enter your email address',
                containerColor: AppColors.white,
              ),
              sh12,
              Text('Subject', style: h4),
              sh8,
              CustomTextField(
                controller: c.subjectController,
                borderRadius: 12,
                hintText: 'What\'s your message about?',
                containerColor: AppColors.white,
              ),
              sh12,
              Text('Message', style: h4),
              sh8,
              CustomTextField(
                controller: c.messageController,
                borderRadius: 12,
                height: 150,
                hintText: 'Type your message here...',
                containerColor: AppColors.white,
              ),
              sh12,
              Obx(() => CustomButton(
                text: c.isLoading.value ? 'Sending...' : 'Send Message',
                onPressed: c.sendFeedback,
                gradientColors: AppColors.buttonColor,
                borderRadius: 12,
              )),
              sh30,
              Row(
                children: [
                  Image.asset(
                    AppImages.email,
                    scale: 4,
                  ),
                  sw5,
                  Text(
                    'support@Yalla.com',
                    style: h6.copyWith(color: Colors.purple),
                  ),
                ],
              ),
              sh12,
              Row(
                children: [
                  Image.asset(
                    AppImages.call,
                    scale: 4,
                  ),
                  sw5,
                  Text(
                    '+1 (234) 567-890',
                    style: h6.copyWith(color: Colors.purple),
                  ),
                ],
              ),
              sh30,
              Center(
                child: Text(
                  'We typically reply within 24 hours',
                  style: h7,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
