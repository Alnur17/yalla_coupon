import 'package:get/get.dart';

import 'package:yalla_coupon/app/modules/profile/controllers/change_password_controller.dart';
import 'package:yalla_coupon/app/modules/profile/controllers/conditions_controller.dart';
import 'package:yalla_coupon/app/modules/profile/controllers/contact_us_controller.dart';
import 'package:yalla_coupon/app/modules/profile/controllers/favorite_controller.dart';
import 'package:yalla_coupon/app/modules/profile/controllers/language_controller.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactUsController>(
      () => ContactUsController(),
    );
    Get.lazyPut<ConditionsController>(
      () => ConditionsController(),
    );
    Get.lazyPut<ChangePasswordController>(
      () => ChangePasswordController(),
    );
    Get.lazyPut<FavoriteController>(
      () => FavoriteController(),
    );
    Get.lazyPut<LanguageController>(
      () => LanguageController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
