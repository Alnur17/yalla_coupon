import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:yalla_coupon/app/modules/coupons/views/coupons_details_view.dart';
import 'package:yalla_coupon/app/modules/home/controllers/notifications_controller.dart';
import 'package:yalla_coupon/common/app_text_style/styles.dart';
import 'package:yalla_coupon/common/helper/date_helper.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/helper/notification_card.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/custom_circular_container.dart';

class NotificationsView extends StatelessWidget {
  NotificationsView({super.key});

  final NotificationsController notificationsController =
      Get.put(NotificationsController());

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
            child: Obx(() {
              if (notificationsController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.bottomBarText,
                  ),
                );
              }

              if (notificationsController.notificationList.isEmpty) {
                return const Center(child: Text('No Notification yet'));
              }

              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: notificationsController.notificationList.length,
                itemBuilder: (context, index) {
                  final item = notificationsController.notificationList[index];
                  return NotificationCard(
                    title: item.title ?? 'Unknown',
                    subtitle: item.body ?? 'Unknown',
                    time: DateHelper.timeAgo(item.createdAt.toString()),
                    image: AppImages.giftBox,
                    onTap: () {
                      Get.to(() => CouponsDetailsView(
                            couponId: item.coupon ?? '',
                          ));
                    },
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
