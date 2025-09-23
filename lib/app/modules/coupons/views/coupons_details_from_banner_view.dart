import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/helper/date_helper.dart';
import '../../../../common/size_box/custom_sizebox.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/model/single_banner_details_model.dart';

class CouponsDetailsFromBannerView extends StatefulWidget {
  final String bannerId;

  const CouponsDetailsFromBannerView({super.key, required this.bannerId});

  @override
  State<CouponsDetailsFromBannerView> createState() =>
      _CouponsDetailsFromBannerViewState();
}

class _CouponsDetailsFromBannerViewState
    extends State<CouponsDetailsFromBannerView> {
  late Timer _timer;
  Duration _timeLeft = Duration.zero;

  final HomeController homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    homeController.fetchSingleBanner(widget.bannerId);

    // initialize countdown when data loads
    ever(homeController.singleBannerDetails, (_) {
      if (homeController.singleBannerDetails.isNotEmpty) {
        final coupon = homeController.singleBannerDetails.first.coupon;
        if (coupon?.validity != null) {
          final now = DateTime.now();
          final validity = coupon!.validity!;
          _timeLeft =
              validity.isAfter(now) ? validity.difference(now) : Duration.zero;
          _startCountdown();
        }
      }
    });
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft.inSeconds > 0) {
        setState(() {
          _timeLeft -= const Duration(seconds: 1);
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final days = _timeLeft.inDays;
    final hours = _timeLeft.inHours % 24;
    final minutes = _timeLeft.inMinutes % 60;
    final seconds = _timeLeft.inSeconds % 60;

    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(12),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Image.asset(AppImages.back, scale: 4),
          ),
        ),
        title: Text("Coupons Details", style: appBarStyle),
      ),
      body: Obx(() {
        if (homeController.isBannerDetailsLoading.value) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.bottomBarText,
          ));
        }

        if (homeController.singleBannerDetails.isEmpty) {
          return const Center(child: Text('No banner details found'));
        }

        final SingleBannerData banner =
            homeController.singleBannerDetails.first;
        final Coupon? coupon = banner.coupon;

        return SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔥 Limited Time Offer
              if (_timeLeft > Duration.zero)
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.red.shade100),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("🔥 Limited Time Offer!",
                          style: h3.copyWith(color: AppColors.darkRed)),
                      sh5,
                      Text(
                          "Only ${DateHelper.timeRemaining(coupon?.validity.toString())} to grab this deal",
                          style: h5.copyWith(color: AppColors.darkRed)),
                      sh12,
                      Row(
                        children: [
                          timeBox(days.toString().padLeft(2, "0"), "Days"),
                          sw8,
                          timeBox(hours.toString().padLeft(2, "0"), "Hours"),
                          sw8,
                          timeBox(minutes.toString().padLeft(2, "0"), "Min"),
                          sw8,
                          timeBox(seconds.toString().padLeft(2, "0"), "Sec"),
                        ],
                      )
                    ],
                  ),
                ),
              sh16,

              /// Coupon Card
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.black100,
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Logo + Title
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: AppColors.white,
                            backgroundImage: banner.image != null
                                ? NetworkImage(banner.image!)
                                : null,
                            child: banner.image == null
                                ? Image.asset(AppImages.offerImage, scale: 4)
                                : null,
                          ),
                          sw8,
                          Text(
                            coupon?.store?.name ?? 'Store',
                            style: h5.copyWith(color: AppColors.white),
                          ),
                        ],
                      ),
                      sh12,
                      Text(
                        coupon?.title ?? '',
                        style: h2.copyWith(color: AppColors.white),
                      ),
                      Text(
                        coupon?.subtitle ?? '',
                        style: h6.copyWith(color: AppColors.white),
                      ),
                      sh16,

                      // Coupon code
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Coupon Code",
                                    style: h5.copyWith(color: AppColors.white)),
                                sh5,
                                Text(
                                  coupon?.code ?? '',
                                  style: h3.copyWith(
                                      color: AppColors.white, fontSize: 18),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.white,
                                foregroundColor: AppColors.black,
                              ),
                              onPressed: () {
                                if (coupon?.code != null) {
                                  Clipboard.setData(
                                      ClipboardData(text: "${coupon!.code}"));
                                  Get.snackbar("Copied",
                                      "${coupon.code} already copied to clipboard");
                                }
                              },
                              child: const Text("Code Copied"),
                            ),
                          ],
                        ),
                      ),
                      sh12,
                      Text(
                        {
                                  DateHelper.timeRemaining(
                                      coupon?.validity.toString())
                                } !=
                                null
                            ? "Valid till ${DateHelper.formatDate(coupon!.validity.toString())}"
                            : '',
                        style: h6.copyWith(color: AppColors.white),
                      ),
                    ],
                  ),
                ),
              ),
              sh16,

              /// Continue To Store button
              CustomButton(
                text: "Continue To Store",
                onPressed: () async {
                  final url = Uri.parse(coupon!.link!);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(
                      url,
                      mode: LaunchMode.externalApplication,
                    );
                  } else {
                    Get.snackbar("Error", "Could not open the store link");
                  }
                },
                backgroundColor: AppColors.transparent,
                borderColor: AppColors.orange,
                borderRadius: 12,
                textStyle: h3.copyWith(color: AppColors.orange),
              ),
              sh20,

              /// How to Use
              sectionTitle("How to Use"),
              sh8,
              for (int i = 0; i < coupon!.howToUse.length; i++)
                stepItem(coupon.howToUse[i], i + 1),

              sh20,

              /// Terms & Conditions
              sectionTitle("Terms & Conditions"),
              sh8,
              for (int i = 0; i < coupon.terms.length; i++)
                stepItem(coupon.terms[i], i + 1),

              sh20,

              /// User Rate
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.green.shade300)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('User Rate',
                        style: h3.copyWith(color: AppColors.darkGreen)),
                    sh12,
                    Text(
                      "${coupon.fakeUses ?? 0} Times copied this coupon",
                      style: h5.copyWith(color: AppColors.green),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget timeBox(String value, String label) {
    return Container(
      height: 65.h,
      width: 60.w,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.darkRed,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(value, style: h3.copyWith(color: AppColors.white)),
          SizedBox(height: 4.h),
          Text(label, style: h6.copyWith(color: AppColors.white)),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Text(title, style: h3);
  }

  Widget stepItem(String text, int number) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        children: [
          Container(
            height: 24.h,
            width: 24.w,
            decoration: ShapeDecoration(
              shape: const CircleBorder(),
              gradient: LinearGradient(colors: AppColors.buttonColor),
            ),
            child: Center(
              child:
                  Text("$number", style: h6.copyWith(color: AppColors.white)),
            ),
          ),
          sw10,
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
