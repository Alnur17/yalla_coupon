import 'package:get/get.dart';

import 'package:yalla_coupon/app/modules/profile/controllers/language_controller.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageController>(
      () => LanguageController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
