import 'package:flutter/material.dart';

import '../app_images/app_images.dart';

class MyActivityCard extends StatelessWidget {
  final String imageType;
  final String title;
  final String subtitle;
  final double scale;

  const MyActivityCard({
    super.key,
    required this.imageType,
    required this.title,
    required this.subtitle,
    this.scale = 4,
  });

  @override
  Widget build(BuildContext context) {
    String imagePath;

    // choose image based on type
    switch (imageType.toUpperCase()) {
      case "VIEW":
        imagePath = AppImages.view;
        break;
      case "COPY":
        imagePath = AppImages.copy;
        break;
      default:
        imagePath = AppImages.copy;
    }

    return ListTile(
      leading: Image.asset(
        imagePath,
        scale: scale,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
