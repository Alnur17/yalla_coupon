import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_coupon/app/modules/home/model/single_banner_details_model.dart';

import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/helper/local_store.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';
import '../model/all_banner_model.dart';
import '../model/currently_sales_model.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  /// banners state
  var isBannerLoading = false.obs;
  var isBannerDetailsLoading = false.obs;
  var isLoading = false.obs;
  var banners = <AllBannerDatum>[].obs;
  var singleBannerDetails = <SingleBannerData>[].obs;
  var currentlySalesList = <CurrentlySalesDatum>[].obs;

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  Future<void> fetchBanners() async {
    try {
      isBannerLoading.value = true;
      final token = LocalStorage.getData(key: AppConstant.token);

      // always include Content-Type
      final headers = {
        "Content-Type": "application/json",
        if (token != null && token.isNotEmpty)
          'Authorization': 'Bearer $token', // only added if token exists
      };
      final response = await BaseClient.getRequest(
        api: Api.allBanners,
        headers: headers,
      );

      final data = await BaseClient.handleResponse(response);

      final bannerModel = AllBannerModel.fromJson(data);
      banners.value = bannerModel.data?.data ?? [];
    } catch (e) {
      debugPrint("Banner fetch error: $e");
    } finally {
      isBannerLoading.value = false;
    }
  }

  Future<void> fetchSingleBanner(String bannerId) async {
    try {
      isBannerDetailsLoading.value = true;
      final token = LocalStorage.getData(key: AppConstant.token);

      // always include Content-Type
      final headers = {
        "Content-Type": "application/json",
        if (token != null && token.isNotEmpty)
          'Authorization': 'Bearer $token', // only added if token exists
      };

      final response = await BaseClient.getRequest(
        api: Api.singleBanners(bannerId),
        headers: headers,
      );

      final data = await BaseClient.handleResponse(response);

      final singleBannerModel = SingleBannerDetailsModel.fromJson(data);
      singleBannerDetails.value =
      singleBannerModel.data == null ? [] : [singleBannerModel.data!];
    } catch (e) {
      debugPrint("Banner fetch error: $e");
    } finally {
      isBannerDetailsLoading.value = false;
    }
  }

  Future<void> fetchCurrentlySales() async {
    try {
      isLoading.value = true;

      final response = await BaseClient.getRequest(
        api: Api.thumbnails,
        headers: {
          "Content-Type": "application/json",
          'Authorization':
          'Bearer ${LocalStorage.getData(key: AppConstant.token)}',
        },
      );

      final data = await BaseClient.handleResponse(response);

      final currentlySalesModel = CurrentlySalesModel.fromJson(data);
      currentlySalesList.value = currentlySalesModel.data;
    } catch (e) {
      debugPrint("Banner fetch error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
