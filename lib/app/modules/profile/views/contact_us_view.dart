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
          'contact_us'.tr, // Dynamic translation for "Contact Us"
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
                'get_in_touch'.tr, // Dynamic translation for "Get in Touch"
                style: h3,
              ),
              sh5,
              Text(
                'we_love_to_hear_from_you'.tr, // Dynamic translation for "We'd love to hear from you!"
                style: h5.copyWith(color: AppColors.greyMedium),
              ),
              sh20,
              Text('name'.tr, style: h4), // Dynamic translation for "Name"
              sh8,
              CustomTextField(
                controller: c.nameController,
                borderRadius: 12,
                hintText: 'enter_your_name'.tr, // Dynamic translation for "Enter your name"
                containerColor: AppColors.white,
              ),
              sh20,
              Text('email_address'.tr, style: h4), // Dynamic translation for "Email Address"
              sh8,
              CustomTextField(
                controller: c.emailController,
                borderRadius: 12,
                hintText: 'enter_your_email'.tr, // Dynamic translation for "Enter your email address"
                containerColor: AppColors.white,
              ),
              sh12,
              Text('subject'.tr, style: h4), // Dynamic translation for "Subject"
              sh8,
              CustomTextField(
                controller: c.subjectController,
                borderRadius: 12,
                hintText: 'whats_your_message_about'.tr, // Dynamic translation for "What's your message about?"
                containerColor: AppColors.white,
              ),
              sh12,
              Text('message'.tr, style: h4), // Dynamic translation for "Message"
              sh8,
              CustomTextField(
                controller: c.messageController,
                borderRadius: 12,
                height: 150,
                hintText: 'type_your_message_here'.tr, // Dynamic translation for "Type your message here..."
                containerColor: AppColors.white,
              ),
              sh12,
              Obx(() => CustomButton(
                text: c.isLoading.value ? 'sending'.tr : 'send_message'.tr, // Dynamic translation for "Send Message"
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
                  'we_typically_reply_within'.tr, // Dynamic translation for "We typically reply within 24 hours"
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
