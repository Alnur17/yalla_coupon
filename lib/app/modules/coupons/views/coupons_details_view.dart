import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yalla_coupon/app/modules/coupons/controllers/coupons_controller.dart';
import 'package:yalla_coupon/common/app_color/app_colors.dart';
import 'package:yalla_coupon/common/app_text_style/styles.dart';
import 'package:yalla_coupon/common/helper/date_helper.dart';
import 'package:yalla_coupon/common/size_box/custom_sizebox.dart';
import 'package:yalla_coupon/common/widgets/custom_button.dart';

import '../../../../common/app_images/app_images.dart';

class CouponsDetailsView extends StatefulWidget {
  final String couponId;

  const CouponsDetailsView({super.key, required this.couponId});

  @override
  State<CouponsDetailsView> createState() => _CouponsDetailsViewState();
}

class _CouponsDetailsViewState extends State<CouponsDetailsView> {
  late Timer _timer;
  Duration _timeLeft = Duration.zero;

  final CouponsController couponsController = Get.put(CouponsController());

  @override
  void initState() {
    super.initState();
    couponsController.fetchSingleCoupons(widget.couponId);

    // Countdown when data loads
    ever(couponsController.singleCoupons, (_) {
      if (couponsController.singleCoupons.isNotEmpty) {
        final coupon = couponsController.singleCoupons.first;
        if (coupon.validity != null) {
          final now = DateTime.now();
          final validity = coupon.validity!;
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
        if (!mounted) return; // <-- safety check
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
        title: Text("coupons_details".tr, style: appBarStyle), // Dynamic translation for "Coupons Details"
      ),
      body: Obx(() {
        if (couponsController.isCouponDetailsLoading.value) {
          return const Center(
              child: CircularProgressIndicator(
                color: AppColors.bottomBarText,
              ));
        }

        if (couponsController.singleCoupons.isEmpty) {
          return Center(child: Text("coupon_not_found".tr));
        }

        final coupon = couponsController.singleCoupons.first;
        final storeName = coupon.store?.name ?? "Unknown Store";
        final code = coupon.code ?? "";
        final subtitle = coupon.subtitle ?? "";
        final title = coupon.title ?? "";
        final validityText = coupon.validity != null
            ? "valid_till".trParams({'date': DateHelper.formatDate(coupon.validity.toString())})
            : "no_expiry".tr; // Dynamic translation for "No expiry"

        return SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Countdown
              if (_timeLeft.inSeconds > 0)
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
                      Text("🔥 ${'limited_time_offer'.tr}!",
                          style: h3.copyWith(color: AppColors.darkRed)),
                      sh5,
                      Text(
                          "${'hurry'.tr} ${DateHelper.timeRemaining(coupon.validity.toString())} ${'grab_this_deal'.tr}",
                          style: h5.copyWith(color: AppColors.darkRed)), // Dynamic translation for "Hurry! {time} Grab this deal"
                      sh12,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          timeBox(days.toString().padLeft(2, "0"), "Days"),
                          sw8,
                          timeBox(hours.toString().padLeft(2, "0"), "Hours"),
                          sw8,
                          timeBox(minutes.toString().padLeft(2, "0"), "Min"),
                          sw8,
                          timeBox(seconds.toString().padLeft(2, "0"), "Sec"),
                        ],
                      ),
                    ],
                  ),
                ),
              sh16,

              // Coupon Card
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFd53369), Color(0xFFdaae51)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: AppColors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: CachedNetworkImage(
                                imageUrl: coupon.store?.image ?? '',
                                fit: BoxFit.contain,
                                height: Get.height,
                                width: Get.width,
                                placeholder: (context, url) => Image.network(
                                  AppImages.imageNotAvailable,
                                  scale: 4,
                                  fit: BoxFit.cover,
                                ),
                                errorWidget: (context, url, error) => Icon(
                                  Icons.error,
                                  color: AppColors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                        sw8,
                        Text(storeName,
                            style: h5.copyWith(color: AppColors.white)),
                      ],
                    ),
                    sh12,
                    Text(title, style: h2.copyWith(color: AppColors.white)),
                    Text(subtitle, style: h6.copyWith(color: AppColors.white)),
                    sh16,

                    // Coupon code
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("coupon_code".tr, style: h5), // Dynamic translation for "Coupon Code"
                              sh5,
                              Text(code, style: h3.copyWith(fontSize: 18)),
                            ],
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.black,
                              foregroundColor: AppColors.white,
                            ),
                            onPressed: () {
                              Clipboard.setData(ClipboardData(text: code));
                              Get.snackbar("copied".tr, "coupon_code_copied".tr); // Dynamic translation for "Coupon code copied"
                            },
                            child: const Text("COPY CODE"),
                          ),
                        ],
                      ),
                    ),
                    sh12,
                    Text(validityText, style: h6.copyWith(color: AppColors.white)),
                  ],
                ),
              ),
              SizedBox(height: 16.h),

              // Copy & Go button
              CustomButton(
                text: "copy_and_go_to_store".tr, // Dynamic translation for "COPY & GO TO STORE"
                onPressed: () async {
                  Clipboard.setData(ClipboardData(text: code));
                  final url = Uri.parse(coupon.link!);
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

              // How to Use
              if (coupon.howToUse.isNotEmpty) ...[
                sectionTitle("how_to_use".tr), // Dynamic translation for "How to Use"
                sh8,
                for (var i = 0; i < coupon.howToUse.length; i++)
                  stepItem(coupon.howToUse[i], i + 1),
                sh20,
              ],

              // Terms & Conditions
              if (coupon.terms.isNotEmpty) ...[
                sectionTitle("terms_conditions".tr), // Dynamic translation for "Terms & Conditions"
                for (var i = 0; i < coupon.terms.length; i++)
                  stepItem(coupon.terms[i], i + 1),
                sh20,
              ],

              // User Rate
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('user_rate'.tr, style: h3.copyWith(color: AppColors.darkGreen)), // Dynamic translation for "User Rate"
                    sh12,
                    Text("${coupon.fakeUses ?? 0} ${'times_copied'.tr}", style: h5.copyWith(color: AppColors.green)), // Dynamic translation for "{number} Times copied"
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

  Widget sectionTitle(String title) => Text(title, style: h3);

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
