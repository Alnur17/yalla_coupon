import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yalla_coupon/app/modules/coupons/views/coupons_details_view.dart';
import 'package:yalla_coupon/app/modules/coupons/views/coupons_view.dart';
import 'package:yalla_coupon/app/modules/coupons/views/single_store_coupons_view.dart';
import 'package:yalla_coupon/app/modules/home/views/notifications_view.dart';
import 'package:yalla_coupon/app/modules/profile/views/profile_view.dart';
import 'package:yalla_coupon/app/modules/store/views/store_view.dart';
import 'package:yalla_coupon/common/app_color/app_colors.dart';
import 'package:yalla_coupon/common/app_images/app_images.dart';
import 'package:yalla_coupon/common/widgets/custom_button.dart';
import 'package:yalla_coupon/common/widgets/custom_row_header.dart';
import 'package:yalla_coupon/common/widgets/search_filed.dart';

import '../../../../common/app_text_style/styles.dart';
import '../../../../common/helper/brand_card.dart';
import '../../../../common/helper/my_activity_card.dart';
import '../../../../common/helper/offer_card.dart';
import '../../../../common/helper/trending_offer_card.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../data/dummy_data.dart';
import '../../coupons/views/coupons_details_from_banner_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Image.asset(AppImages.logoText, scale: 4),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => NotificationsView());
            },
            child: Image.asset(
              AppImages.notification,
              scale: 4,
            ),
          ),
          sw12,
          GestureDetector(
            onTap: (){
              Get.to(()=> ProfileView(showBackButton: true,));
            },
            child: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(AppImages.profileImage, scale: 4),
            ),
          ),
          sw20,
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SearchFiled(onChanged: (value) {}),
            ),
            sh12,
            Container(
              height: 200.h,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: AppColors.silver,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      AppImages.bannerImage,
                      scale: 4,
                      fit: BoxFit.cover,
                      height: Get.height,
                      width: Get.width,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black26,
                    ),
                  ),
                  Positioned(
                    left: 16.w,
                    top: 40.h,
                    right: 16.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("🔥 OFF Amazon!",
                            style: h3.copyWith(color: AppColors.white)),
                        sh8,
                        Text("Limited time offer. Grab it now!",
                            style: h3.copyWith(color: AppColors.white)),
                        sh12,
                        CustomButton(
                          text: 'Get Offer',
                          onPressed: () {
                            Get.to(() => CouponsDetailsFromBannerView());
                          },
                          gradientColors: AppColors.buttonColor,
                          width: 120.w,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            sh20,
            CustomRowHeader(
                title: 'Store',
                onTap: () {
                  Get.to(() => StoreView());
                }),
            sh12,
            SizedBox(
              height: 90.h, // enough for icon + text
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                scrollDirection: Axis.horizontal,
                itemCount: DummyData.brands.length,
                separatorBuilder: (_, __) => SizedBox(width: 16.w),
                itemBuilder: (context, index) {
                  final brand = DummyData.brands[index];
                  return BrandCard(
                    image: brand['image']!,
                    title: brand['name']!,
                    onTap: () {
                      Get.to(() => SingleStoreCouponsView(brand['name']!));
                    },
                  );
                },
              ),
            ),
            sh20,
            CustomRowHeader(
                title: 'Featured Deals',
                onTap: () {
                  Get.to(() => CouponsView());
                }),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: 2,
              itemBuilder: (context, index) {
                final offer = DummyData.offers[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: OfferCard(
                    title: offer['title'],
                    subtitle: offer['subtitle'],
                    image: offer['image'],
                    validTill: offer['validTill'],
                    usageCount: offer['usageCount'],
                    isFavorite: offer['isFavorite'],
                    onFavoriteTap: () {},
                    onButtonTap: () {
                      Get.to(() => CouponsDetailsView());
                    },
                  ),
                );
              },
            ),
            CustomRowHeader(
              title: '🔥Top Trending Coupons',
            ),
            sh16,
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 2,
              itemBuilder: (context, index) {
                final offer = DummyData.offers[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TrendingOfferCard(
                    title: offer['title'],
                    subtitle: offer['subtitle'],
                    imagePath: offer['image'],
                    usageText: offer['usageCount'],
                    onTap: () {
                      Get.to(() => CouponsDetailsView());
                    },
                  ),
                );
              },
            ),
            sh8,
            CustomRowHeader(title: 'Your Activity'),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20.w),
            //   child: Text('Your Activity',style: h3,),
            // ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.silver)),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: DummyData.activityHome.length,
                itemBuilder: (context, index) {
                  final item = DummyData.activityHome[index];
                  return MyActivityCard(
                    imageType: item["type"]!,
                    title: item["title"]!,
                    subtitle: item["subtitle"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Container(
// padding: const EdgeInsets.all(8),
// decoration: BoxDecoration(
// color: AppColors.white,
// border: Border.all(color: AppColors.silver),
// borderRadius: BorderRadius.circular(16),
// ),
// child: Column(
// children: [
// Row(
// children: [
// Container(
// height: 50,
// width: 50,
// decoration: BoxDecoration(
// color: AppColors.silver,
// borderRadius: BorderRadius.circular(8),
// ),
// child: ClipRRect(
// borderRadius: BorderRadius.circular(8),
// child: Image.asset(
// AppImages.offerImage,
// scale: 4,
// ),
// ),
// ),
// sw8,
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text('50% OFF First Order', style: h3),
// Text(
// 'Uber Eats',
// style: h5,
// ),
// ],
// ),
// Spacer(),
// Text(
// '2.3k times used',
// style: h5.copyWith(color: AppColors.bottomBarText),
// ),
// ],
// ),
// ],
// ),
// ),
