import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_coupon/common/app_color/app_colors.dart';
import 'package:yalla_coupon/common/app_images/app_images.dart';
import 'package:yalla_coupon/common/app_text_style/styles.dart';
import '../size_box/custom_sizebox.dart';

class StoreCard extends StatelessWidget {
  final String storeName;
  final String couponCount;
  final String imagePath;
  final VoidCallback? onTap;

  const StoreCard({
    super.key,
    required this.storeName,
    required this.couponCount,
    this.imagePath = AppImages.offerImage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.silver),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: AppColors.silver,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imagePath,
                  scale: 4,
                ),
              ),
            ),
            sw8,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(storeName, style: h3),
                Text(
                  "$couponCount Coupons",
                  style: h6,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
