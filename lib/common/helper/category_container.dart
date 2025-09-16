import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yalla_coupon/common/app_color/app_colors.dart';
import 'package:yalla_coupon/common/app_text_style/styles.dart';

import '../size_box/custom_sizebox.dart';

class BrandCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback? onTap;

  const BrandCard({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 45.h,
            width: 45.w,
            decoration: BoxDecoration(
             // color: AppColors.silver,
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
          SizedBox(
            width: 70.w, // give a width so text wraps nicely
            child: Text(
              title,
              style: h5,
              maxLines: 2, // allow up to 2 lines
              overflow: TextOverflow.ellipsis, // optional
              textAlign: TextAlign.center, // center text under image
            ),
          ),
          //sh8,
        ],
      ),
    );
  }
}
