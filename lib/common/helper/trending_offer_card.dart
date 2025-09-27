import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_coupon/common/app_color/app_colors.dart';
import 'package:yalla_coupon/common/app_images/app_images.dart';
import 'package:yalla_coupon/common/app_text_style/styles.dart';
import 'package:yalla_coupon/common/widgets/custom_button.dart';

import '../size_box/custom_sizebox.dart';

class TrendingOfferCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String usageText;
  final String imagePath;
  final VoidCallback? onTap;
  final VoidCallback onButtonTap;

  const TrendingOfferCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.usageText,
    this.imagePath = AppImages.offerImage,
    this.onTap,
    required this.onButtonTap,
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
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: h3),
                      Row(
                        children: [
                          Text(subtitle, style: h5),
                          const Spacer(),
                          Text(
                            '$usageText times used',
                            style: h5.copyWith(color: AppColors.bottomBarText),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // const Spacer(),
                // Text(
                //   '$usageText times\nused',
                //   style: h5.copyWith(color: AppColors.bottomBarText),
                // ),
              ],
            ),
            sh12,
            CustomButton(
              text: 'Get Code',
              onPressed: onButtonTap,
              backgroundColor: AppColors.silver,
              borderRadius: 12,
              textStyle: h3,
            ),
          ],
        ),
      ),
    );
  }
}
