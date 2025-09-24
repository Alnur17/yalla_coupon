import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_coupon/app/data/api.dart';
import 'package:yalla_coupon/app/data/base_client.dart';
import 'package:yalla_coupon/app/modules/home/model/notifications_model.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/helper/local_store.dart';
import '../../../../common/widgets/custom_snackbar.dart';

class NotificationsController extends GetxController {
  final isLoading = false.obs;
  var notificationList = <NotificationsDatum>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetNotifications();
  }

  Future<void> fetNotifications() async {
    try {
      isLoading.value = true;

      String token = LocalStorage.getData(key: AppConstant.token);

      final header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      };

      final response = await BaseClient.getRequest(
        api: Api.notification,
        headers: header,
      );

      final data = await BaseClient.handleResponse(response);

      final notificationModel = NotificationsModel.fromJson(data);

      notificationList.value = notificationModel.data?.data ?? [];
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
