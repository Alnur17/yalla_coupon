import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
            Text('Activity Log', style: appBarStyle),
            Text('Your Activity Log', style: h5),
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
          // Expanded content inside Obx
          Expanded(
            child: Obx(() {
              // loading state
              if (activityLogController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              // filter activity list
              final filteredList = activityLogController.activityList
                  .where((log) =>
                  log.items.any((item) =>
                  (item.storeName ?? '')
                      .toLowerCase()
                      .contains(searchQuery.value.toLowerCase()) ||
                      (item.couponTitle ?? '')
                          .toLowerCase()
                          .contains(searchQuery.value.toLowerCase())))
                  .toList();

              // empty state
              if (filteredList.isEmpty) {
                return const Center(child: Text('No activity found.'));
              }

              // list
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  final log = filteredList[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // if you want to show the label/date group heading
                      // if (log.label != null)
                      //   Padding(
                      //     padding: EdgeInsets.symmetric(vertical: 8.h),
                      //     child: Text(
                      //       log.label!,
                      //       style: h5.copyWith(color: Colors.white),
                      //     ),
                      //   ),

                      // now list of all items in this group
                      ...log.items.map((item) {
                        return Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: ActivityLogCard(
                            storeName: item.storeName ?? '',
                            couponCode: item.couponTitle ?? '',
                            dateTime: item.createdAt != null
                                ? item.createdAt!.toString()
                                : '',
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
