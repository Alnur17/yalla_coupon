import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalla_coupon/common/app_text_style/styles.dart';


class CategoryContainer extends StatelessWidget {
  final String image;
  final String name;
  final VoidCallback? onTap;
  final bool isSelected;

  const CategoryContainer({
    super.key,
    required this.image,
    required this.name,
    this.onTap,
    this.isSelected = false,
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
              color: isSelected ? Colors.pink.shade50 : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: isSelected
                  ? Border.all(color: Colors.pink, width: 2)
                  : null,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                image,
                scale: 4,
              ),
            ),
          ),
          SizedBox(
            width: 70.w,
            child: Text(
              name,
              style: h5.copyWith(
                color: isSelected ? Colors.pink : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

