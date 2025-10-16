import 'package:flutter/material.dart';
import '../../../common/app_color/app_colors.dart'; // adjust the import path as needed

class SocialButtonCircle extends StatelessWidget {
  final String asset;
  final double padding;
  final double scale;
  final Color backgroundColor;
  final VoidCallback? onTap;

  const SocialButtonCircle({
    super.key,
    required this.asset,
    this.padding = 8,
    this.scale = 4,
    this.backgroundColor = AppColors.white,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: ShapeDecoration(
          shape: const CircleBorder(),
          color: backgroundColor,
        ),
        child: Image.asset(asset, scale: scale),
      ),
    );
  }
}
