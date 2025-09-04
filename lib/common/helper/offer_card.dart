import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_coupon/app/modules/auth/forgot_password/views/forgot_password_view.dart';
import 'package:yalla_coupon/common/app_color/app_colors.dart';
import 'package:yalla_coupon/common/app_images/app_images.dart';
import 'package:yalla_coupon/common/app_text_style/styles.dart';

import '../size_box/custom_sizebox.dart';
import '../widgets/custom_button.dart';

class OfferCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final String validTill;
  final String usageCount;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final VoidCallback onButtonTap;

  const OfferCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.validTill,
    required this.usageCount,
    this.isFavorite = false,
    required this.onFavoriteTap,
    required this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: AppColors.silver,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    image,
                    scale: 4,
                  ),
                ),
              ),
              sw8,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: h3),
                  Text(subtitle, style: h6),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: onFavoriteTap,
                child: Image.asset(
                  isFavorite ? AppImages.favoriteFilled : AppImages.favorite,
                  scale: 4,
                ),
              ),
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
          sh12,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Valid till: $validTill',
                style: h5,
              ),
              Text(
                '$usageCount times used',
                style: h5.copyWith(color: AppColors.bottomBarText),
              ),
            ],
          )
        ],
      ),
    );
  }
}
