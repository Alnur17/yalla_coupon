import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:yalla_coupon/app/modules/coupons/controllers/coupons_controller.dart';
import 'package:yalla_coupon/common/helper/date_helper.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/helper/offer_card.dart';
import '../../../../common/widgets/search_filed.dart';
import 'coupons_details_view.dart';

class SingleStoreCouponsView extends StatefulWidget {
  final String storeName;
  final String storeImage;
  final String storeId;

  const SingleStoreCouponsView(this.storeName, this.storeImage, this.storeId,
      {super.key});

  @override
  State<SingleStoreCouponsView> createState() => _SingleStoreCouponsViewState();
}

class _SingleStoreCouponsViewState extends State<SingleStoreCouponsView> {
  final CouponsController couponsController = Get.find();

  @override
  void initState() {
    super.initState();
    couponsController.fetchCouponsByStoreId(widget.storeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text(
          '${widget.storeName} ${'coupons'.tr}', // Dynamic translation for "Coupons"
          style: appBarStyle,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            height: 160.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.silver,
                borderRadius: BorderRadius.circular(16)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                widget.storeImage,
                scale: 4,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SearchFiled(onChanged: (value) {}),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                padding: EdgeInsets.all(16.sp),
                itemCount: couponsController.singleStoreCoupons.length,
                itemBuilder: (context, index) {
                  final offer = couponsController.singleStoreCoupons[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: OfferCard(
                      title: offer.title ?? 'Unknown',
                      subtitle: offer.subtitle ?? 'Unknown',
                      image: offer.store.first.image ?? '',
                      validTill: DateHelper.timeRemaining(offer.validity.toString()),
                      usageCount: offer.fakeUses.toString(),
                      isFavorite: offer.isFavorite ?? false,
                      onFavoriteTap: () {
                        // 🔹 Handle favorite toggle
                      },
                      onButtonTap: () {
                        Get.to(() => CouponsDetailsView(
                          couponId: offer.id ?? '',
                        ));
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
