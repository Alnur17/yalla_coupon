import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:yalla_coupon/app/modules/activity_log/views/activity_log_view.dart';
import 'package:yalla_coupon/app/modules/category/views/category_view.dart';
import 'package:yalla_coupon/app/modules/coupons/views/coupons_view.dart';
import 'package:yalla_coupon/app/modules/home/views/home_view.dart';
import 'package:yalla_coupon/app/modules/profile/views/profile_view.dart';
import 'package:yalla_coupon/common/app_color/app_colors.dart';
import 'package:yalla_coupon/common/app_images/app_images.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      CategoryView(),
      CouponsView(),
      ActivityLogView(),
      ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset(AppImages.homeFilled, scale: 4),
        inactiveIcon: Image.asset(AppImages.home, scale: 4),
        title: "home".tr, // Dynamic translation for "Home"
        contentPadding: 0,
        // 🔥 Reduce gap
        activeColorPrimary: AppColors.bottomBarText,
        inactiveColorPrimary: AppColors.transparent,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(AppImages.categoryFilled, scale: 4),
        inactiveIcon: Image.asset(AppImages.category, scale: 4),
        title: "category".tr, // Dynamic translation for "Category"
        contentPadding: 0,
        activeColorPrimary: AppColors.bottomBarText,
        inactiveColorPrimary: AppColors.transparent,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(AppImages.couponFilled, scale: 4),
        inactiveIcon: Image.asset(AppImages.coupon, scale: 4),
        title: "coupons".tr, // Dynamic translation for "Coupons"
        contentPadding: 0,
        activeColorPrimary: AppColors.bottomBarText,
        inactiveColorPrimary: AppColors.transparent,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(AppImages.activityLogFilled, scale: 4),
        inactiveIcon: Image.asset(AppImages.activityLog, scale: 4),
        title: "activity_log".tr, // Dynamic translation for "Activity Log"
        contentPadding: 0,
        activeColorPrimary: AppColors.bottomBarText,
        inactiveColorPrimary: AppColors.transparent,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(AppImages.profileFilled, scale: 4),
        inactiveIcon: Image.asset(AppImages.profile, scale: 4),
        title: "profile".tr, // Dynamic translation for "Profile"
        contentPadding: 0,
        activeColorPrimary: AppColors.bottomBarText,
        inactiveColorPrimary: AppColors.transparent,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final PersistentTabController controller =
    PersistentTabController(initialIndex: 0);

    return Scaffold(
      body: PersistentTabView(
        context,
        controller: controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        navBarStyle: NavBarStyle.style3,
        navBarHeight: 65, // Taller navbar
      ),
    );
  }
}
