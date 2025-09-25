import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_coupon/app/modules/category/model/all_category_model.dart';

import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/helper/local_store.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';

class CategoryController extends GetxController {
  final isLoading = false.obs;

  final categoryList = <AllCategoryDatum>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategory();
  }

  Future<void> fetchCategory() async {
    try {
      isLoading.value = true;

      final response = await BaseClient.getRequest(
        api: Api.allCategory,
        headers: {
          "Content-Type": "application/json",
          'Authorization':
              'Bearer ${LocalStorage.getData(key: AppConstant.token)}',
        },
      );

      final data = await BaseClient.handleResponse(response);
      final categoryModel = AllCategoryModel.fromJson(data);
      categoryList.value = categoryModel.data?.data ?? [];
    } catch (e) {
      debugPrint("Banner fetch error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
