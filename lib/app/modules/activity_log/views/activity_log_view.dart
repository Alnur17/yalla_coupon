import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yalla_coupon/common/helper/date_helper.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/helper/activity_log_card.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/search_filed.dart';
import '../controllers/activity_log_controller.dart';

class ActivityLogView extends StatelessWidget {
  ActivityLogView({super.key});

  final ActivityLogController activityLogController =
  Get.put(ActivityLogController());

  // Local Rx variable to hold search query
  final RxString searchQuery = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('activity_log'.tr, style: appBarStyle), // Dynamic translation for "Activity Log"
            Text('your_activity_log'.tr, style: h5), // Dynamic translation for "Your Activity Log"
          ],
        ),
      ),
      body: Column(
        children: [
          sh12,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SearchFiled(
              onChanged: (value) => searchQuery.value = value,
            ),
          ),

          Expanded(
            child: Obx(() {
              if (activityLogController.isLoading.value) {
                return const Center(child: CircularProgressIndicator(color: AppColors.bottomBarText,));
              }

              final filteredList = activityLogController.activityList
                  .where((log) =>
                  log.items.any((item) =>
                  (item.storeName ?? '')
                      .toLowerCase()
                      .contains(searchQuery.value.toLowerCase()) ||
                      (item.couponCode ?? '')
                          .toLowerCase()
                          .contains(searchQuery.value.toLowerCase())))
                  .toList();

              if (filteredList.isEmpty) {
                return Center(child: Text('no_activity_found'.tr)); // Dynamic translation for "No activity found."
              }

              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  final log = filteredList[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Label/date group heading
                      if (log.label != null)
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Text(
                            log.label!,
                            style: h5,
                          ),
                        ),

                      //List of all items in this group
                      ...log.items.map((item) {
                        return Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: ActivityLogCard(
                            storeName: item.storeName ?? '',
                            couponCode: item.couponCode ?? '',
                            dateTime: DateHelper.formatDate(item.createdAt.toString()),
                            status: item.type ?? '',
                            imagePath: item.storeImage ?? '',
                            onTap: () {
                              debugPrint("${item.storeName ?? ''} tapped");
                            },
                          ),
                        );
                      }).toList(),
                    ],
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
