import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:yalla_coupon/app/data/dummy_data.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/helper/activity_log_card.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/search_filed.dart';
import '../controllers/activity_log_controller.dart';

class ActivityLogView extends GetView<ActivityLogController> {
  const ActivityLogView({super.key});
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
              'Activity Log',
              style: appBarStyle,
            ),
            Text(
              'Your Activity Log',
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
              padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 12),
              itemCount: DummyData.activityLogData.length,
              itemBuilder: (context, index) {
                final log = DummyData.activityLogData[index];
                return Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: ActivityLogCard(
                    storeName: log["storeName"]!,
                    couponCode: log["couponCode"]!,
                    dateTime: log["dateTime"]!,
                    status: log["status"]!,
                    imagePath: log["imagePath"]!,
                    onTap: () {
                      print("${log['storeName']} tapped");
                    },
                  ),
                );
              },
            ),
          )

        ],
      ),
    );
  }
}
