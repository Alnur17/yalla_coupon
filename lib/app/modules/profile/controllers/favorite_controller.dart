import 'package:get/get.dart';

import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/helper/local_store.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';
import '../model/favorite_model.dart';

class FavoriteController extends GetxController {
  var isLoading = false.obs;
  var favorites = <FavoriteDatum>[].obs;

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
}
