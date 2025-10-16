import 'dart:convert';

import 'package:get/get.dart';
import 'package:yalla_coupon/app/modules/coupons/controllers/coupons_controller.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/helper/local_store.dart';
import '../../../../common/widgets/custom_snackbar.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';
import '../model/favorite_model.dart';

class FavoriteController extends GetxController {
  var isLoading = false.obs;
  var isAddOrRemoveLoading = false.obs;
  var favorites = <FavoriteDatum>[].obs;

  final couponsController = Get.find<CouponsController>();

  @override
  void onInit() {
    super.onInit();
    fetchFavorites();
  }

  Future<void> fetchFavorites() async {
    try {
      isLoading.value = true;
      final headers = {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer ${LocalStorage.getData(key: AppConstant.token)}',
      };

      final response = await BaseClient.getRequest(
        api: Api.favourite,
        headers: headers,
      );
      final data = await BaseClient.handleResponse(response);
      final model = FavoriteModel.fromJson(data);
      favorites.assignAll(model.data?.data ?? []);
    } catch (e) {
      print('Error fetching favorites: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addOrRemoveFavorites(String couponId) async {
    try {
      isAddOrRemoveLoading.value = true;
      final headers = {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer ${LocalStorage.getData(key: AppConstant.token)}',
      };

      final body = {
        "coupon": couponId,
      };
      final response = await BaseClient.postRequest(
        api: Api.addOrRemoveFavourite,
        body: jsonEncode(body),
        headers: headers,
      );
      final data = await BaseClient.handleResponse(response);

      if(data !=null){
        kSnackBar(
          message: data['message'] ?? 'successful!',
          bgColor: AppColors.green,
        );
        fetchFavorites();
        await couponsController.fetchAllCoupons();
        await couponsController.fetchFeaturedCoupons();
      }
    } catch (e) {
      print('Error on add or remove favorites: $e');
    } finally {
      isAddOrRemoveLoading.value = false;
    }
  }
}
