import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yalla_coupon/app/modules/coupons/views/coupons_details_view.dart';
import 'package:yalla_coupon/common/app_color/app_colors.dart';
import 'package:yalla_coupon/common/helper/date_helper.dart';

import '../../../../common/app_text_style/styles.dart';
import '../../../../common/helper/offer_card.dart';
import '../../../../common/widgets/search_filed.dart';
import '../controllers/coupons_controller.dart';

class CouponsView extends StatelessWidget {
  CouponsView({super.key});

  final CouponsController couponsController = Get.put(CouponsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('All Coupons', style: appBarStyle),
            Text('Top Deals Just for You', style: h5),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SearchFiled(onChanged: (value) {
              // implement search if needed
            }),
          ),
          Expanded(
            child: Obx(() {
              if (couponsController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.bottomBarText,
                  ),
                );
              }

              if (couponsController.allCoupons.isEmpty) {
                return const Center(child: Text("No coupons found"));
              }

              return ListView.builder(
                padding: EdgeInsets.all(16.sp),
                itemCount: couponsController.allCoupons.length,
                itemBuilder: (context, index) {
                  final coupon = couponsController.allCoupons[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: OfferCard(
                      title: coupon.title ?? '',
                      subtitle: coupon.store.first.name ?? '',
                      image: coupon.store.first.image ?? '',
                      validTill:
                          DateHelper.formatDate(coupon.validity.toString()),
                      usageCount: coupon.fakeUses.toString(),
                      isFavorite: coupon.isFavorite ?? false,
                      onFavoriteTap: () {
                        // handle favorite
                      },
                      onButtonTap: () {
                        Get.to(() => CouponsDetailsView(couponId: coupon.id ?? ''));
                      },
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
