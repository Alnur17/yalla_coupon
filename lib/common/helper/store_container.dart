import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_coupon/common/app_color/app_colors.dart';
import 'package:yalla_coupon/common/app_text_style/styles.dart';

import '../size_box/custom_sizebox.dart';

class StoreContainer extends StatelessWidget {
  final String image;
  final String name;
  final VoidCallback? onTap;

  const StoreContainer({
    super.key,
    required this.image,
    required this.name,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(4),
            height: 65.h,
            width: 65.w,
            decoration: BoxDecoration(
              color: AppColors.silver,
              borderRadius: BorderRadius.circular(50),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                image,
                scale: 4,
              ),
            ),
          ),
          sh8,
          Text(
            name,
            style: h5,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          //sh8,
        ],
      ),
    );
  }
}
