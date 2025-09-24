import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yalla_coupon/common/app_color/app_colors.dart';
import 'package:yalla_coupon/common/app_images/app_images.dart';
import 'package:yalla_coupon/common/app_text_style/styles.dart';
import '../../../../common/helper/date_helper.dart';
import '../../../../common/helper/offer_card.dart';
import '../../../../common/widgets/custom_circular_container.dart';
import '../controllers/favorite_controller.dart';

class FavouriteView extends StatelessWidget {
   FavouriteView({super.key});

   final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text('Favorite', style: appBarStyle),
        leading: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: CustomCircularContainer(
            imagePath: AppImages.back,
            onTap: () => Get.back(),
            padding: 2,
          ),
        ),
      ),
      body: Obx(() {
        if (favoriteController.isLoading.value) {
          return const Center(child: CircularProgressIndicator(color: AppColors.bottomBarText,));
        }
        if (favoriteController.favorites.isEmpty) {
          return const Center(child: Text('No favorites yet'));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: favoriteController.favorites.length,
          itemBuilder: (context, index) {
            final fav = favoriteController.favorites[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: OfferCard(
                title: fav.coupon?.title ?? 'Unknown',
                subtitle: fav.coupon?.store?.name ?? 'Unknown',
                image: fav.coupon?.store?.image ?? AppImages.offerImage,
                validTill: DateHelper.formatDate(fav.coupon?.validity.toString()),
                usageCount: fav.coupon?.fakeUses.toString() ?? '0',
                isFavorite: true,
                onFavoriteTap: () {
                  favoriteController.addOrRemoveFavorites(fav.coupon?.id ?? '');
                },
                onButtonTap: () {},
              ),
            );
          },
        );
      }),
    );
  }
}
