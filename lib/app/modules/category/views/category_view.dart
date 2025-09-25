import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:yalla_coupon/app/modules/category/controllers/category_controller.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/helper/all_category_container.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/search_filed.dart';
import '../../store/views/store_view.dart';

class CategoryView extends StatelessWidget {
  CategoryView({super.key});

  final CategoryController categoryController = Get.put(CategoryController());

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
            child: Obx(() {
              if (categoryController.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.bottomBarText,
                  ),
                );
              }
              if (categoryController.categoryList.isEmpty) {
                return Center(
                  child: Text(
                    "No category available",
                    style: h5,
                  ),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                itemCount: categoryController.categoryList.length,
                itemBuilder: (context, index) {
                  final category = categoryController.categoryList[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: AllCategoryContainer(
                      categoryName: category.name ?? 'Unknown',
                      storeCount: category.storeCount.toString(),
                      imagePath: category.image ?? '',
                      onTap: () {
                        Get.to(() => StoreView(
                              categoryName: category.name ?? 'Unknown',
                          categoryId: category.id ?? '',
                            ));
                        print("${category.name ?? 'Unknown'} tapped");
                      },
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
