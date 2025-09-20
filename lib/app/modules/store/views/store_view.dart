import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:yalla_coupon/app/data/dummy_data.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/helper/store_card.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/search_filed.dart';
import '../../coupons/views/single_store_coupons_view.dart';
import '../controllers/store_controller.dart';

class StoreView extends GetView<StoreController> {
  final String categoryName;
  const StoreView( {super.key, required this.categoryName,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$categoryName Stores',
              style: appBarStyle,
            ),
            Text(
              'View Category wise Stores',
              style: h5,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          sh12,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SearchFiled(onChanged: (value) {}),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              itemCount: DummyData.stores.length,
              itemBuilder: (context, index) {
                final store = DummyData.stores[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: StoreCard(
                    storeName: store['storeName'],
                    couponCount: store['couponCount'],
                    imagePath: store['imagePath'],
                    onTap: () {
                      Get.to(() => SingleStoreCouponsView(store['storeName'],store['imagePath'],));
                      print("${store['storeName']} tapped");
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
