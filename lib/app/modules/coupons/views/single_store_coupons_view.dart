import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/helper/offer_card.dart';
import '../../../../common/widgets/search_filed.dart';
import '../../../data/dummy_data.dart';
import 'coupons_details_view.dart';

class SingleStoreCouponsView extends GetView {
  final String storeName;
  const SingleStoreCouponsView(this.storeName, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text('$storeName Coupons',style: appBarStyle,),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SearchFiled(onChanged: (value) {}),
          ),
          //sh12,
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.sp),
              itemCount: DummyData.offers.length,
              itemBuilder: (context, index) {
                final offer = DummyData.offers[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: OfferCard(
                    title: offer['title'],
                    subtitle: offer['subtitle'],
                    image: offer['image'],
                    validTill: offer['validTill'],
                    usageCount: offer['usageCount'],
                    isFavorite: offer['isFavorite'],
                    onFavoriteTap: () {
                      // 🔹 Handle favorite toggle
                    },
                    onButtonTap: () {
                      Get.to(()=> CouponsDetailsView());
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
