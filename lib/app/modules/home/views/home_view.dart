import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yalla_coupon/app/modules/activity_log/controllers/activity_log_controller.dart';
import 'package:yalla_coupon/app/modules/category/controllers/category_controller.dart';
import 'package:yalla_coupon/app/modules/category/views/category_view.dart';
import 'package:yalla_coupon/app/modules/coupons/controllers/coupons_controller.dart';
import 'package:yalla_coupon/app/modules/coupons/views/coupons_details_view.dart';
import 'package:yalla_coupon/app/modules/coupons/views/single_store_coupons_view.dart';
import 'package:yalla_coupon/app/modules/home/views/notifications_view.dart';
import 'package:yalla_coupon/app/modules/profile/controllers/profile_controller.dart';
import 'package:yalla_coupon/app/modules/profile/views/profile_view.dart';
import 'package:yalla_coupon/app/modules/store/controllers/store_controller.dart';
import 'package:yalla_coupon/common/app_color/app_colors.dart';
import 'package:yalla_coupon/common/app_images/app_images.dart';
import 'package:yalla_coupon/common/helper/store_container.dart';
import 'package:yalla_coupon/common/widgets/custom_button.dart';
import 'package:yalla_coupon/common/widgets/custom_row_header.dart';
import 'package:yalla_coupon/common/widgets/search_filed.dart';

import '../../../../common/app_text_style/styles.dart';
import '../../../../common/helper/category_container.dart';
import '../../../../common/helper/date_helper.dart';
import '../../../../common/helper/my_activity_card.dart';
import '../../../../common/helper/offer_card.dart';
import '../../../../common/helper/trending_offer_card.dart';
import '../../../../common/size_box/custom_sizebox.dart';
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
  final CategoryController categoryController = Get.find();

  final StoreController storeController = Get.put(StoreController());
  final ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();

    homeController.fetchBanners();
    homeController.fetchCurrentlySales();

    ever(categoryController.categoryList, (_) {
      if (categoryController.categoryList.isNotEmpty) {
        final firstCategory =
        categoryController.categoryList[homeController.selectedIndex.value];
        storeController.fetchStores(firstCategory.id ?? '');
      }
    });
  }

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
            child: Obx(() {
              final imagePath = profileController.profileImageUrl.value;
              return CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.whiteDark,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: imagePath.startsWith("http")
                      ? CachedNetworkImage(
                    imageUrl: imagePath,
                    height: Get.height.h,
                    width: Get.width.w,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.bottomBarText,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  )
                      : Image.file(
                    File(imagePath),
                    height: Get.height.h,
                    width: Get.width.w,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
          ),
          sw20,
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  child: Center(child: Text('no_banners_available'.tr)), // Dynamic translation for "No banners available"
                );
              }

              return CarouselSlider(
                options: CarouselOptions(
                  height: 180.h,
                  autoPlay: true,
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
                                    text: 'get_offer'.tr, // Dynamic translation for "Get Offer"
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
                                    width: 140.w,
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
                      title: 'categories'.tr, // Dynamic translation for "Categories"
                      onTap: () {
                        Get.to(() => CategoryView());
                      }),
                  sh12,
                  SizedBox(
                    height: 90.h,
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
                            "no_category_available".tr, // Dynamic translation for "No category available"
                            style: h5,
                          ),
                        );
                      }

                      return ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryController.categoryList.length,
                        separatorBuilder: (_, __) => SizedBox(width: 16.w),
                        itemBuilder: (context, index) {
                          final category =
                          categoryController.categoryList[index];
                          return Obx(() => CategoryContainer(
                            image: category.image ?? '',
                            name: category.name ?? 'Unknown',
                            isSelected:
                            homeController.selectedIndex.value == index,
                            onTap: () {
                              homeController.setSelectedIndex(index);

                              final category =
                              categoryController.categoryList[index];
                              storeController
                                  .fetchStores(category.id ?? '');
                            },
                          ));
                        },
                      );
                    }),
                  ),
                  Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  sh12,
                  Obx(() {
                    if (storeController.isLoading.value) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.bottomBarText,
                        ),
                      );
                    }
                    if (storeController.storeList.isEmpty) {
                      return Center(
                        child: Text(
                          "no_category_available".tr, // Dynamic translation for "No category available"
                          style: h5,
                        ),
                      );
                    }
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      // will show at most 9 items, or less if list is shorter
                      itemCount: min(9, storeController.storeList.length),
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        final store = storeController.storeList[index];
                        return StoreContainer(
                          image: store.image ?? '',
                          name: store.name ?? 'Unknown',
                          onTap: () {
                            Get.to(
                                  () => SingleStoreCouponsView(
                                  store.name ?? 'Unknown',
                                  store.image ?? '',
                                  store.id ?? ''),
                            );
                          },
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
            sh20,
            CustomRowHeader(
              title: "🔥 ${'top_trending_coupons'.tr}", // Dynamic translation for "Top Trending Coupons"
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
                  child: Center(child: Text('no_trending_coupons'.tr)), // Dynamic translation for "No Trending Coupons available"
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
            }),
            sh16,
            CustomRowHeader(
              title: 'sales_currently'.tr, // Dynamic translation for "Sales Currently"
            ),
            sh12,
            Obx(() {
              if (homeController.isLoading.value) {
                return SizedBox(
                  height: 100.h,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.bottomBarText,
                    ),
                  ),
                );
              }

              if (homeController.currentlySalesList.isEmpty) {
                return SizedBox(
                  height: 50.h,
                  child: Center(child: Text('no_sales_available'.tr)), // Dynamic translation for "No Sales available"
                );
              }

              return CarouselSlider(
                options: CarouselOptions(
                  height: 150.0,
                  autoPlay: true,
                ),
                items: homeController.currentlySalesList.map<Widget>((sale) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => CouponsDetailsView(
                            couponId: sale.coupon?.id ?? '',
                          ));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              sale.image ?? '', // adjust field if different
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) =>
                              const Icon(Icons.image_not_supported),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              );
            }),
            sh16,
            CustomRowHeader(
              title: 'featured_deals'.tr, // Dynamic translation for "Featured Deals"
              // onTap: () {
              //   Get.to(() => CouponsView());
              // },
            ),
            Obx(() {
              if (couponsController.isFeaturedCouponLoading.value) {
                return SizedBox(
                  height: 100.h,
                  child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.bottomBarText,
                      )),
                );
              }

              if (couponsController.featuredCoupons.isEmpty) {
                return SizedBox(
                  height: 50.h,
                  child: Center(child: Text('no_featured_coupons'.tr)), // Dynamic translation for "No Featured Coupons available"
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                itemCount: couponsController.featuredCoupons.length,
                itemBuilder: (context, index) {
                  final coupon = couponsController.featuredCoupons[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: OfferCard(
                      title: coupon.title ?? '',
                      subtitle: coupon.store.first.name ?? '',
                      image: coupon.store.first.image ?? '',
                      validTill:
                      DateHelper.formatDate(coupon.validity.toString()),
                      usageCount: coupon.fakeUses.toString(),
                      isFavorite: coupon.isFavorite ?? false,
                      onFavoriteTap: () {
                        favoriteController
                            .addOrRemoveFavorites(coupon.id ?? '');
                      },
                      onButtonTap: () {
                        Get.to(() =>
                            CouponsDetailsView(couponId: coupon.id ?? ''));
                      },
                    ),
                  );
                },
              );
            }),
            CustomRowHeader(title: 'your_activity'.tr), // Dynamic translation for "Your Activity"
            Obx(() {
              if (activityLogController.isLoading.value) {
                return SizedBox(
                  height: 100.h,
                  child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.bottomBarText,
                      )),
                );
              }

              if (activityLogController.activityList.isEmpty) {
                return Padding(
                  padding: EdgeInsets.all(20).r,
                  child: Center(child: Text("no_activity_yet".tr)), // Dynamic translation for "No activity yet"
                );
              }

              final allItems = activityLogController.activityList
                  .expand((activity) => activity.items)
                  .toList();

              return Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.silver),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: allItems.length,
                  itemBuilder: (context, index) {
                    final item = allItems[index];
                    return MyActivityCard(
                      imageType: item.type ?? '',
                      subtitle: DateHelper.timeAgo(item.createdAt.toString()),
                      title: item.couponCode ?? '',
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
