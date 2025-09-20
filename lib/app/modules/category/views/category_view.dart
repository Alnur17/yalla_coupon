import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/helper/all_category_container.dart';
import '../../../../common/helper/store_card.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/search_filed.dart';
import '../../../data/dummy_data.dart';
import '../../coupons/views/single_store_coupons_view.dart';
import '../../store/views/store_view.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Category',
              style: appBarStyle,
            ),
            Text(
              'View All Category',
              style: h5,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          sh12,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SearchFiled(onChanged: (value) {}),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              itemCount: DummyData.category.length,
              itemBuilder: (context, index) {
                final category = DummyData.category[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: AllCategoryContainer(
                    categoryName: category['categoryName'],
                    storeCount: category['storeCount'],
                    imagePath: category['imagePath'],
                    onTap: () {
                      Get.to(() => StoreView(categoryName: category['categoryName'], ));
                      print("${category['categoryName']} tapped");
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
