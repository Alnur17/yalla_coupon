import 'package:get/get.dart';

import 'package:yalla_coupon/app/modules/home/controllers/notifications_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationsController>(
      () => NotificationsController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
