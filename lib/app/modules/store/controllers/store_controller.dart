import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/helper/local_store.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';
import '../model/all_store_model.dart';

class StoreController extends GetxController {
  final isLoading = false.obs;

  final storeList = <AllStoreDatum>[].obs;

  Future<void> fetchStores(String categoryId) async {
    try {
      isLoading.value = true;

      final response = await BaseClient.getRequest(
        api: Api.allStores(categoryId),
        headers: {
          "Content-Type": "application/json",
          'Authorization':
          'Bearer ${LocalStorage.getData(key: AppConstant.token)}',
        },
      );

      final data = await BaseClient.handleResponse(response);
      final storeModel = AllStoreModel.fromJson(data);
      // Defer the update after current frame
      // WidgetsBinding.instance.addPostFrameCallback((_) {
        storeList.assignAll(storeModel.data?.data ?? []);
      // });
    } catch (e) {
      debugPrint("Banner fetch error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
