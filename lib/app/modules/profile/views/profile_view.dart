import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:yalla_coupon/app/modules/profile/views/faq_view.dart';
import 'package:yalla_coupon/app/modules/profile/views/favourite_view.dart';
import 'package:yalla_coupon/app/modules/profile/views/feedback_view.dart';
import 'package:yalla_coupon/app/modules/profile/views/language_view.dart';
import 'package:yalla_coupon/app/modules/profile/views/privacy_and_policy_view.dart';
import 'package:yalla_coupon/app/modules/profile/views/terms_and_conditions_view.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_list_tile.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../auth/login/views/login_view.dart';
import '../controllers/profile_controller.dart';
import 'change_password_view.dart';
import 'edit_profile_view.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  //final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        scrolledUnderElevation: 0,
        title: const Text('Profile'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              sh20,
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.white,
                      backgroundImage: NetworkImage(
                        AppImages.profileImageTwo,
                      ),
                    ),
                    sh12,
                    Text(
                      'Alex Richards',
                      style: h3.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'alex.Richards@**90.com',
                      style: h5.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              sh30,
              Text(
                'Account',
                style: h3,
              ),
              Text(
                'Update your info to your account',
                style: h5,
              ),
              sh12,
              Container(
                decoration: BoxDecoration(
                    color: AppColors.silver,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    CustomListTile(
                      onTap: () {
                        Get.to(() => EditProfileView());
                      },
                      leadingImage: AppImages.accountInfo,
                      title: 'Account Information',
                      trailingImage: AppImages.arrowRight,
                    ),
                    CustomListTile(
                      onTap: () {
                        Get.to(() => LanguageView());
                      },
                      leadingImage: AppImages.accountInfo,
                      title: 'Language',
                      trailingImage: AppImages.arrowRight,
                    ),
                    CustomListTile(
                      onTap: () {
                        Get.to(() => FavouriteView());
                      },
                      leadingImage: AppImages.accountInfo,
                      title: 'Favourite',
                      trailingImage: AppImages.arrowRight,
                    ),
                  ],
                ),
              ),
              sh16,
              Text(
                'Privacy',
                style: h3,
              ),
              Text(
                'View your privacy',
                style: h5,
              ),
              sh12,
              Container(
                decoration: BoxDecoration(
                    color: AppColors.silver,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    CustomListTile(
                      onTap: () {
                        Get.to(() => ChangePasswordView());
                      },
                      leadingImage: AppImages.accountInfo,
                      title: 'Change  Password ',
                      trailingImage: AppImages.arrowRight,
                    ),
                    CustomListTile(
                      onTap: () {
                        Get.to(() => TermsAndConditionsView());
                      },
                      leadingImage: AppImages.accountInfo,
                      title: 'Terms and conditions',
                      trailingImage: AppImages.arrowRight,
                    ),
                    CustomListTile(
                      onTap: () {
                        Get.to(() => PrivacyAndPolicyView());
                      },
                      leadingImage: AppImages.accountInfo,
                      title: 'Privacy and Policies',
                      trailingImage: AppImages.arrowRight,
                    ),
                  ],
                ),
              ),
              sh16,
              Container(
                decoration: BoxDecoration(
                    color: AppColors.silver,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    CustomListTile(
                      onTap: () {
                        Get.to(() => FeedbackView());
                      },
                      leadingImage: AppImages.accountInfo,
                      title: 'Feedback',
                      trailingImage: AppImages.arrowRight,
                    ),
                    CustomListTile(
                      onTap: () {
                        Get.to(() => FaqView());
                      },
                      leadingImage: AppImages.accountInfo,
                      title: 'FAQ',
                      trailingImage: AppImages.arrowRight,
                    ),
                  ],
                ),
              ),
              sh16,
              CustomListTile(
                onTap: () {
                  _showLogoutDialog(context);
                },
                leadingImage: AppImages.accountInfo,
                title: 'Log Out',
                trailingImage: AppImages.arrowRight,
              ),
              sh40,
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top Icon/Image
              Image.asset(
                AppImages.logoutBig, // <- make sure you have this image
                height: 60,
                width: 60,
              ),
              sh16,

              // Title & Description
              Text(
                "Are you sure you want to log out of your account?",
                textAlign: TextAlign.center,
                style: h3.copyWith(fontWeight: FontWeight.w500),
              ),
              sh20,

              // Confirm Logout Button
              CustomButton(
                text: "Confirm Log Out",
                backgroundColor: AppColors.red,
                textColor: AppColors.white,
                onPressed: () {
                  Get.offAll(() => LoginView()); // clear navigation stack
                },
              ),
            sh12,

              // Cancel Button
              CustomButton(
                text: "Cancel",
                backgroundColor: AppColors.silver,
                textColor: AppColors.black,
                onPressed: () {
                  Get.back(); // close dialog
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}
