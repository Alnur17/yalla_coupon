import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_coupon/common/app_color/app_colors.dart';
import 'package:yalla_coupon/common/app_text_style/styles.dart';
import '../size_box/custom_sizebox.dart';

class ActivityLogCard extends StatelessWidget {
  final String storeName;
  final String couponCode;
  final String dateTime;
  final String status; // Viewed, Copied
  final String imagePath;
  final VoidCallback? onTap;

  const ActivityLogCard({
    super.key,
    required this.storeName,
    required this.couponCode,
    required this.dateTime,
    required this.status,
    required this.imagePath,
    this.onTap,
  });

  Color _statusColor() {
    switch (status) {
      case 'VIEW':
        return Colors.blue[100]!;
      case 'COPY':
        return Colors.pink[100]!;
      default:
        return AppColors.silver;
    }
  }

  Color _statusTextColor() {
    switch (status) {
      case 'VIEW':
        return Colors.blue;
      case 'COPY':
        return Colors.pink;
      default:
        return AppColors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.silver),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                child: Image.asset(
                  imagePath,
                  scale: 4,
                ),
              ),
            ),
            sw8,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(storeName, style: h3),
                  Text(couponCode, style: h5),
                  Text(dateTime, style: h6.copyWith(color: AppColors.grey)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: _statusColor(),
              ),
              child: Text(
                status,
                style: h6.copyWith(color: _statusTextColor()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
