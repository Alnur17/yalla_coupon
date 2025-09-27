import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/helper/store_card.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/search_filed.dart';
import '../../coupons/views/single_store_coupons_view.dart';
import '../controllers/store_controller.dart';

class StoreView extends StatefulWidget {
  final String categoryName;
  final String categoryId;
 const StoreView( {super.key, required this.categoryName, required this.categoryId,});

  @override
  State<StoreView> createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  final StoreController storeController = Get.put(StoreController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((__) {
       storeController.fetchStores(widget.categoryId);
    },);
  }

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
              '${widget.categoryName} Stores',
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
            child: Obx(
               () {
                 if (storeController.isLoading.value) {
                   return Center(
                     child: CircularProgressIndicator(
                       color: AppColors.bottomBarText,
                     ),
                   );
                 }
                 if (storeController.storeList.isEmpty) {
                   return Center(
                     child: Text(
                       "No category available",
                       style: h5,
                     ),
                   );
                 }
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  itemCount: storeController.storeList.length,
                  itemBuilder: (context, index) {
                    final store = storeController.storeList[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: StoreCard(
                        storeName: store.name ?? 'Unknown',
                        couponCount: store.couponCount.toString(),
                        imagePath: store.image ?? '',
                        onTap: () {
                          Get.to(() => SingleStoreCouponsView(store.name ?? 'Unknown',store.image ?? '',store.id ?? ''));
                          print("${store.name ?? 'Unknown'} tapped");
                        },
                      ),
                    );
                  },
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
