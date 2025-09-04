import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:yalla_coupon/common/app_text_style/styles.dart';
import 'package:yalla_coupon/common/widgets/custom_button.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/helper/notification_card.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/custom_circular_container.dart';
import '../../../data/dummy_data.dart';

class NotificationsView extends GetView {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text(
          'Alerts',
          style: appBarStyle,
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: CustomCircularContainer(
            imagePath: AppImages.back,
            onTap: () {
              Get.back();
            },
            padding: 2,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              'Active Coupons',
              style: h3,
            ),
          ),
          sh12,
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: DummyData.notifications.length,
              itemBuilder: (context, index) {
                final item = DummyData.notifications[index];
                return NotificationCard(
                  title: item['title']!,
                  subtitle: item['subtitle']!,
                  time: item['time']!,
                  image: item['image']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
