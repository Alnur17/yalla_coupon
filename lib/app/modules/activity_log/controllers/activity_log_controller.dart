import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_coupon/app/modules/activity_log/model/activity_log_model.dart';

import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/helper/local_store.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';

class ActivityLogController extends GetxController {
  final isLoading = false.obs;

  var activityList = <ActivityDatum>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchActivityLog();
  }

  Future<void> fetchActivityLog() async {
    try {
      isLoading.value = true;

      final response = await BaseClient.getRequest(
        api: Api.activityLog,
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${LocalStorage.getData(key: AppConstant.token)}',
        },
      );

      final data = await BaseClient.handleResponse(response);

      final activityModel = ActivityLogModel.fromJson(data);
      activityList.value = activityModel.data?.data ?? [];
    } catch (e) {
      debugPrint("Banner fetch error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
