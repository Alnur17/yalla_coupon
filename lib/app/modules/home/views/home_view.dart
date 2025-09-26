import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yalla_coupon/app/modules/activity_log/controllers/activity_log_controller.dart';
import 'package:yalla_coupon/app/modules/category/views/category_view.dart';
import 'package:yalla_coupon/app/modules/coupons/controllers/coupons_controller.dart';
import 'package:yalla_coupon/app/modules/coupons/views/coupons_details_view.dart';
import 'package:yalla_coupon/app/modules/coupons/views/single_store_coupons_view.dart';
import 'package:yalla_coupon/app/modules/home/views/notifications_view.dart';
import 'package:yalla_coupon/app/modules/profile/views/profile_view.dart';
import 'package:yalla_coupon/common/app_color/app_colors.dart';
import 'package:yalla_coupon/common/app_images/app_images.dart';
import 'package:yalla_coupon/common/helper/store_container.dart';
import 'package:yalla_coupon/common/widgets/custom_button.dart';
import 'package:yalla_coupon/common/widgets/custom_row_header.dart';
import 'package:yalla_coupon/common/widgets/search_filed.dart';

import '../../../../common/app_text_style/styles.dart';
import '../../../../common/helper/category_container.dart';
import '../../../../common/helper/my_activity_card.dart';
import '../../../../common/helper/offer_card.dart';
import '../../../../common/helper/trending_offer_card.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../data/dummy_data.dart';
import '../../coupons/views/coupons_details_from_banner_view.dart';
import '../../profile/controllers/favorite_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController homeController = Get.put(HomeController());
  final FavoriteController favoriteController = Get.put(FavoriteController());
  final CouponsController couponsController = Get.put(CouponsController());
  final ActivityLogController activityLogController =
      Get.put(ActivityLogController());

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
            onTap: () {
              Get.to(() => ProfileView(
                    showBackButton: true,
                  ));
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
            Obx(() {
              if (homeController.isBannerLoading.value) {
                return SizedBox(
                  height: 100.h,
                  child: Center(
                      child: CircularProgressIndicator(
                    color: AppColors.bottomBarText,
                  )),
                );
              }

              if (homeController.banners.isEmpty) {
                return SizedBox(
                  height: 50.h,
                  child: Center(child: Text('No banners available')),
                );
              }

              return CarouselSlider(
                options: CarouselOptions(
                  height: 180.h,
                  autoPlay: true,
                  onPageChanged: (index, reason) {},
                ),
                items: homeController.banners.map((banner) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: AppColors.silver,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                banner.image ?? '',
                                fit: BoxFit.cover,
                                height: Get.height,
                                width: Get.width,
                                errorBuilder: (_, __, ___) =>
                                    Icon(Icons.image_not_supported),
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
                              top: 20.h,
                              right: 16.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    banner.title ?? '',
                                    style: h3.copyWith(color: AppColors.white),
                                  ),
                                  sh8,
                                  Text(
                                    banner.subTitle ?? '',
                                    style: h3.copyWith(color: AppColors.white),
                                  ),
                                  sh12,
                                  CustomButton(
                                    text: 'Get Offer',
                                    onPressed: () {
                                      if (banner.coupon != null &&
                                          banner.coupon!.code!.isNotEmpty) {
                                        Clipboard.setData(ClipboardData(
                                            text: banner.coupon!.code!));
                                      }
                                      Get.to(() => CouponsDetailsFromBannerView(
                                            bannerId: banner.id ?? '',
                                          ));
                                    },
                                    gradientColors: AppColors.buttonColor,
                                    width: 120.w,
                                    height: 40.h,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              );
            }),
            sh20,
            Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.borderColor),
              ),
              child: Column(
                children: [
                  CustomRowHeader(
                      title: 'Categories',
                      onTap: () {
                        Get.to(() => CategoryView());
                      }),
                  sh12,
                  SizedBox(
                    height: 90.h,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      scrollDirection: Axis.horizontal,
                      itemCount: DummyData.category.length,
                      separatorBuilder: (_, __) => SizedBox(width: 16.w),
                      itemBuilder: (context, index) {
                        final category = DummyData.category[index];
                        return Obx(() => CategoryContainer(
                              image: category['imagePath']!,
                              title: category['categoryName']!,
                              isSelected:
                                  homeController.selectedIndex.value == index,
                              onTap: () {
                                homeController.setSelectedIndex(index);
                              },
                            ));
                      },
                    ),
                  ),
                  Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  sh12,
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    // will show at most 9 items, or less if list is shorter
                    itemCount: min(9, DummyData.brands.length),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      final brand = DummyData.brands[index];
                      return StoreContainer(
                        image: brand['image']!,
                        title: brand['name']!,
                        onTap: () {
                          Get.to(
                            () => SingleStoreCouponsView(
                              brand['name']!,
                              brand['image']!,
                              brand["id"]!,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            sh20,
            CustomRowHeader(
              title: '🔥Top Trending Coupons',
            ),
            sh16,
            Obx(() {
              if (couponsController.isTrendingCouponLoading.value) {
                return SizedBox(
                  height: 100.h,
                  child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.bottomBarText,
                      )),
                );
              }

              if (couponsController.trendingCoupons.isEmpty) {
                return SizedBox(
                  height: 50.h,
                  child: Center(child: Text('No Trending Coupons available')),
                );
              }

              return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: couponsController.trendingCoupons.length,
                  itemBuilder: (context, index) {
                    final offer = couponsController.trendingCoupons[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TrendingOfferCard(
                        title: offer.title ?? 'Unknown',
                        subtitle: offer.subtitle ?? 'Unknown',
                        imagePath: offer.store.first.image ?? '',
                        usageText: offer.fakeUses.toString(),
                        onButtonTap: () {
                          Get.to(() => CouponsDetailsView(
                            couponId: offer.id ?? '',
                          ));
                        },
                        onTap: () {
                          Get.to(() => CouponsDetailsView(
                                couponId: offer.id ?? '',
                              ));
                        },
                      ),
                    );
                  },
                );
              }
            ),
            sh16,
            CustomRowHeader(
              title: 'Sales Currently',
            ),
            sh12,
            CarouselSlider(
              options: CarouselOptions(
                height: 150.0,
                autoPlay: true,
                onPageChanged: (index, reason) {},
              ),
              items: DummyData.currentSales.map<Widget>((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          item['image_url']!,
                          scale: 4,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            sh16,
            CustomRowHeader(
              title: 'Featured Deals',
              // onTap: () {
              //   Get.to(() => CouponsView());
              // },
            ),
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
                    image: offer['image'] ?? AppImages.offerImage,
                    validTill: offer['validTill'],
                    usageCount: offer['usageCount'],
                    isFavorite: offer['isFavorite'],
                    onFavoriteTap: () {},
                    onButtonTap: () {
                      Get.to(() => CouponsDetailsView(
                            couponId: '',
                          ));
                    },
                  ),
                );
              },
            ),
            // Obx(() {
            //   if (couponsController.isLoading.value) {
            //     return const Center(
            //       child: CircularProgressIndicator(
            //         color: AppColors.bottomBarText,
            //       ),
            //     );
            //   }
            //
            //   if (couponsController.allCoupons.isEmpty) {
            //     return const Center(child: Text("No coupons found"));
            //   }
            //
            //   return ListView.builder(
            //       shrinkWrap: true,
            //       physics: NeverScrollableScrollPhysics(),
            //     padding: EdgeInsets.all(16.sp),
            //     itemCount: 2,
            //     itemBuilder: (context, index) {
            //       final coupon = couponsController.allCoupons[index];
            //
            //       return Padding(
            //         padding: const EdgeInsets.only(bottom: 8.0),
            //         child: OfferCard(
            //           title: coupon.title ?? '',
            //           subtitle: coupon.store.first.name ?? '',
            //           image: coupon.store.first.image ?? '',
            //           validTill:
            //           DateHelper.formatDate(coupon.validity.toString()),
            //           usageCount: coupon.fakeUses.toString(),
            //           isFavorite: coupon.isFavorite ?? false,
            //           onFavoriteTap: () {
            //             favoriteController.addOrRemoveFavorites(coupon.id ?? '');
            //           },
            //           onButtonTap: () {
            //             Get.to(() => CouponsDetailsView(couponId: coupon.id ?? ''));
            //           },
            //         ),
            //       );
            //     },
            //   );
            // }),
            //sh8,
            CustomRowHeader(title: 'Your Activity'),
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
