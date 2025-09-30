// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'package:get/get.dart';
// import 'package:yalla_coupon/common/widgets/custom_background_color.dart';
//
// import '../../../../../common/app_color/app_colors.dart';
// import '../../../../../common/app_images/app_images.dart';
// import '../../../../../common/app_text_style/styles.dart';
// import '../../../../../common/size_box/custom_sizebox.dart';
// import '../../../../../common/widgets/custom_button.dart';
// import '../../../../../common/widgets/custom_loader.dart';
// import '../../../../../common/widgets/custom_textfield.dart';
// import '../../forgot_password/views/forgot_password_view.dart';
// import '../../sign_up/views/sign_up_view.dart';
// import '../controllers/login_controller.dart';
//
// class LoginView extends StatefulWidget {
//   const LoginView({super.key});
//
//   @override
//   State<LoginView> createState() => _LoginViewState();
// }
//
// class _LoginViewState extends State<LoginView> {
//   LoginController loginController = Get.put(LoginController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.background,
//         scrolledUnderElevation: 0,
//         title: Image.asset(
//           AppImages.logoText,
//           scale: 4,
//         ),
//         titleSpacing: 8,
//         leading: Padding(
//           padding: EdgeInsets.only(left: 8.w),
//           child: GestureDetector(
//               onTap: () {
//                 Get.back();
//               },
//               child: Image.asset(
//                 AppImages.back,
//                 scale: 4,
//               )),
//         ),
//       ),
//       body: CustomBackgroundColor(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20).r,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 sh20,
//                 Text(
//                   'login_to_account'.tr,
//                   style: h2.copyWith(
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 sh12,
//                 Text(
//                   'quick_easy_login'.tr,
//                   style: h4,
//                 ),
//                 sh40,
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('email'.tr, style: h4),
//                     sh8,
//                     CustomTextField(
//                       hintText: 'your_email'.tr,
//                       containerColor: AppColors.white,
//                       controller: loginController.emailTEController,
//                     ),
//                     sh12,
//                     Text('password'.tr, style: h4),
//                     sh8,
//                     Obx(() {
//                       return CustomTextField(
//                         sufIcon: GestureDetector(
//                           onTap: () {
//                             loginController.togglePasswordVisibility();
//                           },
//                           child: Image.asset(
//                             loginController.isPasswordVisible.value
//                                 ? AppImages.eyeOpen
//                                 : AppImages.eyeClose,
//                             scale: 4,
//                           ),
//                         ),
//                         obscureText: !loginController.isPasswordVisible.value,
//                         hintText: '**********',
//                         containerColor: AppColors.white,
//                         controller: loginController.passwordTEController,
//                       );
//                     }),
//                   ],
//                 ),
//                 sh16,
//                 GestureDetector(
//                   onTap: () {
//                     Get.to(() => const ForgotPasswordView());
//                   },
//                   child: Text(
//                     'forgot_password'.tr,
//                     style: h4.copyWith(color: AppColors.blue),
//                   ),
//                 ),
//                 sh16,
//                 GestureDetector(
//                   onTap: () {
//                     Get.to(() => const SignUpView());
//                   },
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'dont_have_account'.tr,
//                         style: h4.copyWith(color: AppColors.grey),
//                       ),
//                       sw8,
//                       Text(
//                         'sign_up'.tr,
//                         style: h4.copyWith(
//                           color: AppColors.bottomBarText,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 sh24,
//                 Obx(
//                   () {
//                     return loginController.isLoading.value == true
//                         ? CustomLoader(color: AppColors.white)
//                         : CustomButton(
//                             text: 'login'.tr, // Dynamic translation for "Login"
//                             onPressed: () {
//                               loginController.userLogin(
//                                   // email: emailTEController.text,
//                                   // password: passwordTEController.text,
//                                   );
//                             },
//                             imageAssetPath: AppImages.arrowRightNormal,
//                             gradientColors: AppColors.buttonColor,
//                           );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_images/app_images.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../../common/size_box/custom_sizebox.dart';
import '../../../../../common/widgets/custom_background_color.dart';
import '../../../../../common/widgets/custom_button.dart';
import '../../../../../common/widgets/custom_loader.dart';
import '../../../../../common/widgets/custom_textfield.dart';
import '../../forgot_password/views/forgot_password_view.dart';
import '../../sign_up/views/sign_up_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        scrolledUnderElevation: 0,
        title: Image.asset(
          AppImages.logoText,
          scale: 4,
        ),
        titleSpacing: 8,
        leading: Padding(
          padding: EdgeInsets.only(left: 8.w),
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
      ),
      body: CustomBackgroundColor(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sh20,
                Text(
                  'login_to_account'.tr,
                  style: h2.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                sh12,
                Text(
                  'quick_easy_login'.tr,
                  style: h4,
                ),
                sh40,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('email'.tr, style: h4),
                    sh8,
                    CustomTextField(
                      hintText: 'your_email'.tr,
                      containerColor: AppColors.white,
                      controller: loginController.emailTEController,
                    ),
                    sh12,
                    Text('password'.tr, style: h4),
                    sh8,
                    Obx(() {
                      return CustomTextField(
                        sufIcon: GestureDetector(
                          onTap: () {
                            loginController.togglePasswordVisibility();
                          },
                          child: Image.asset(
                            loginController.isPasswordVisible.value
                                ? AppImages.eyeOpen
                                : AppImages.eyeClose,
                            scale: 4,
                          ),
                        ),
                        obscureText: !loginController.isPasswordVisible.value,
                        hintText: '**********',
                        containerColor: AppColors.white,
                        controller: loginController.passwordTEController,
                      );
                    }),
                  ],
                ),
                sh16,
                GestureDetector(
                  onTap: () {
                    Get.to(() => const ForgotPasswordView());
                  },
                  child: Text(
                    'forgot_password'.tr,
                    style: h4.copyWith(color: AppColors.blue),
                  ),
                ),
                sh16,
                GestureDetector(
                  onTap: () {
                    Get.to(() => const SignUpView());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'dont_have_account'.tr,
                        style: h4.copyWith(color: AppColors.grey),
                      ),
                      sw8,
                      Text(
                        'sign_up'.tr,
                        style: h4.copyWith(
                          color: AppColors.bottomBarText,
                        ),
                      ),
                    ],
                  ),
                ),
                sh24,
                Obx(
                      () => loginController.isLoading.value
                      ? CustomLoader(color: AppColors.white)
                      : Column(
                    children: [
                      CustomButton(
                        text: 'login'.tr,
                        onPressed: () {
                          loginController.userLogin();
                        },
                        imageAssetPath: AppImages.arrowRightNormal,
                        gradientColors: AppColors.buttonColor,
                      ),
                    ],
                  ),
                ),
                sh16,
                Center(
                  child: Text(
                    'or_login_with'.tr, // Add translation for "Or login with"
                    style: h4.copyWith(color: AppColors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
                sh16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: loginController.signInWithGoogle,
                      child: Image.asset(
                        AppImages.google, // Replace with your Google icon
                        width: 40.w,
                        height: 40.h,
                      ),
                    ),
                    sw16,
                    GestureDetector(
                      onTap: loginController.signInWithFacebook,
                      child: Image.asset(
                        AppImages.facebook, // Replace with your Facebook icon
                        width: 40.w,
                        height: 40.h,
                      ),
                    ),
                    sw16,
                    //if (SignInWithApple.isAvailable()) // Show Apple button only on iOS
                    GestureDetector(
                      onTap: loginController.signInWithApple,
                      child: Image.asset(
                        AppImages.apple, // Replace with your Apple icon
                        width: 40.w,
                        height: 40.h,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}