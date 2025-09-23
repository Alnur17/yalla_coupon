import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_coupon/app/modules/coupons/model/single_coupon_details_model.dart';

import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/helper/local_store.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';
import '../model/all_coupons_model.dart';

class CouponsController extends GetxController {
  var isLoading = false.obs;
  var isCouponDetailsLoading = false.obs;

  var allCoupons = <AllCouponsDatum>[].obs;
  var singleCoupons = <SingleCouponData>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllCoupons();
  }

  Future<void> fetchAllCoupons() async {
    try {
      isLoading.value = true;

      final response = await BaseClient.getRequest(
        api: Api.allCoupons,
        headers: {
          "Content-Type": "application/json",
          'Authorization':
              'Bearer ${LocalStorage.getData(key: AppConstant.token)}',
        },
      );

      final data = await BaseClient.handleResponse(response);

      final couponsModel = AllCouponsModel.fromJson(data);

      allCoupons.value = couponsModel.data?.data ?? [];
    } catch (e) {
      debugPrint("All Coupons fetch error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchSingleCoupons(String couponId) async {
    try {
      isCouponDetailsLoading.value = true;

      final response = await BaseClient.getRequest(
        api: Api.singleCoupons(couponId),
        headers: {
          "Content-Type": "application/json",
          'Authorization':
              'Bearer ${LocalStorage.getData(key: AppConstant.token)}',
        },
      );

      final data = await BaseClient.handleResponse(response);

      final singleCouponsModel = SingleCouponsDetailsModel.fromJson(data);
      singleCoupons.value = singleCouponsModel.data == null ? [] : [singleCouponsModel.data!];
    } catch (e) {
      debugPrint("Banner fetch error: $e");
    } finally {
      isCouponDetailsLoading.value = false;
    }
  }
}
