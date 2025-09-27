import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_coupon/app/modules/coupons/model/featured_coupons_model.dart';
import 'package:yalla_coupon/app/modules/coupons/model/single_coupon_details_model.dart';
import 'package:yalla_coupon/app/modules/coupons/model/trending_coupons_model.dart';

import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/helper/local_store.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';
import '../model/all_coupons_model.dart';

class CouponsController extends GetxController {
  var isLoading = false.obs;
  var isCouponDetailsLoading = false.obs;
  var isSingleStoreCouponLoading = false.obs;
  var isTrendingCouponLoading = false.obs;
  var isFeaturedCouponLoading = false.obs;

  var allCoupons = <AllCouponsDatum>[].obs;
  var singleCoupons = <SingleCouponData>[].obs;
  var singleStoreCoupons = <AllCouponsDatum>[].obs;
  var trendingCoupons = <TrendingDatum>[].obs;
  var featuredCoupons = <FeaturedCouponsDatum>[].obs;


  @override
  void onInit() {
    super.onInit();
    fetchAllCoupons();
    fetchTrendingCoupons();
    fetchFeaturedCoupons();
  }

  Future<void> fetchFeaturedCoupons() async {
    try {
      isFeaturedCouponLoading.value = true;

      final response = await BaseClient.getRequest(
        api: Api.featuredCoupons,
        headers: {
          "Content-Type": "application/json",
          'Authorization':
              'Bearer ${LocalStorage.getData(key: AppConstant.token)}',
        },
      );

      final data = await BaseClient.handleResponse(response);

      final featuredModel = FeaturedCouponsModel.fromJson(data);

      featuredCoupons.value = featuredModel.data?.data ?? [];


    } catch (e) {
      debugPrint("Featured Coupons fetch error: $e");
    } finally {
      isFeaturedCouponLoading.value = false;
    }
  }

  Future<void> fetchTrendingCoupons() async {
    try {
      isTrendingCouponLoading.value = true;

      final response = await BaseClient.getRequest(
        api: Api.trendingCoupons,
        headers: {
          "Content-Type": "application/json",
          'Authorization':
              'Bearer ${LocalStorage.getData(key: AppConstant.token)}',
        },
      );

      final data = await BaseClient.handleResponse(response);

      final trendingModel = TrendingCouponsModel.fromJson(data);

      trendingCoupons.value = trendingModel.data?.data ?? [];
    } catch (e) {
      debugPrint("Trending Coupons fetch error: $e");
    } finally {
      isTrendingCouponLoading.value = false;
    }
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

  Future<void> fetchCouponsByStoreId(String storeId) async {
    try {
      isSingleStoreCouponLoading.value = true;

      final response = await BaseClient.getRequest(
        api: Api.couponsByStoreId(storeId),
        headers: {
          "Content-Type": "application/json",
          'Authorization':
              'Bearer ${LocalStorage.getData(key: AppConstant.token)}',
        },
      );

      final data = await BaseClient.handleResponse(response);

      final singleStoreCouponsModel = AllCouponsModel.fromJson(data);
      singleStoreCoupons.value = singleStoreCouponsModel.data?.data ?? [];
    } catch (e) {
      debugPrint("Banner fetch error: $e");
    } finally {
      isSingleStoreCouponLoading.value = false;
    }
  }
}
