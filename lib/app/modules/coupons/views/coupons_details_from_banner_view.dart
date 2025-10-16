import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yalla_coupon/app/modules/auth/login/views/login_view.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/app_text_style/styles.dart';
import '../../../../common/helper/date_helper.dart';
import '../../../../common/helper/local_store.dart';
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
  Timer? _timer;
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
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft.inSeconds > 0) {
        if (!mounted) return; // safety check
        setState(() {
          _timeLeft -= const Duration(seconds: 1);
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
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
        title: Text("coupons_details".tr,
            style: appBarStyle), // Dynamic translation for "Coupons Details"
      ),
      body: Obx(() {
        if (homeController.isBannerDetailsLoading.value) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.bottomBarText,
          ));
        }

        if (homeController.singleBannerDetails.isEmpty) {
          return Center(
              child: Text('no_banner_details'
                  .tr)); // Dynamic translation for "No banner details found"
        }

        final SingleBannerData banner =
            homeController.singleBannerDetails.first;
        final Coupon? coupon = banner.coupon;

        // check if coupon is null
        if (coupon == null) {
          return Scaffold(
            backgroundColor: AppColors.mainColor,
            body: Center(
                child: Text('no_coupon_available'
                    .tr)), // Dynamic translation for "No coupon available for this banner"
          );
        }

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
                      Text("🔥 ${'limited_time_offer'.tr}!",
                          // Dynamic translation for "Limited Time Offer"
                          style: h3.copyWith(color: AppColors.darkRed)),
                      sh5,
                      Text(
                          "${'only'.tr} ${DateHelper.timeRemaining(coupon.validity.toString())} ${'to_grab_this_deal'.tr}",
                          style: h5.copyWith(color: AppColors.darkRed)),
                      // Dynamic translation for "Only {time} to grab this deal"
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
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: CachedNetworkImage(
                                  imageUrl: banner.image ?? '',
                                  fit: BoxFit.contain,
                                  height: Get.height,
                                  width: Get.width,
                                  // shows whole image inside circle
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
                          Text(
                            coupon.store?.name ?? 'Store',
                            style: h5.copyWith(color: AppColors.white),
                          ),
                        ],
                      ),
                      sh12,
                      Text(
                        coupon.title ?? '',
                        style: h2.copyWith(color: AppColors.white),
                      ),
                      Text(
                        coupon.subtitle ?? '',
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
                                Text(
                                  "coupon_code".tr,
                                  // Dynamic translation for "Coupon Code"
                                  style: h5.copyWith(color: AppColors.white),
                                ),
                                sh5,
                                Builder(builder: (_) {
                                  final String? token = LocalStorage.getData(
                                      key: AppConstant.token);
                                  final bool isPremium =
                                      coupon.type?.toLowerCase() == 'premium';

                                  // Determine display code
                                  final String displayCode = (token == null ||
                                              token.isEmpty) &&
                                          isPremium
                                      ? (coupon.code != null
                                          ? '${coupon.code!.substring(0, 2)}****'
                                          : '')
                                      : coupon.code ?? '';

                                  return Text(
                                    displayCode,
                                    style: h3.copyWith(
                                        color: AppColors.white, fontSize: 18),
                                  );
                                }),
                              ],
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.white,
                                foregroundColor: AppColors.black,
                              ),
                              onPressed: () {
                                final String? token = LocalStorage.getData(
                                    key: AppConstant.token);
                                final bool isPremium =
                                    coupon.type?.toLowerCase() == 'premium';

                                if ((token != null && token.isNotEmpty) ||
                                    !isPremium) {
                                  if (coupon.code != null) {
                                    Clipboard.setData(
                                        ClipboardData(text: coupon.code!));
                                    Get.snackbar("Copied",
                                        "Coupon already copied to clipboard");
                                  }
                                } else {
                                  Get.to(() => const LoginView());
                                  Get.snackbar(
                                    "Premium Coupon",
                                    "Sign in to view full coupon code",
                                    backgroundColor: AppColors.white,
                                  );
                                }
                              },
                              child: Builder(builder: (_) {
                                final String? token = LocalStorage.getData(
                                    key: AppConstant.token);
                                final bool isPremium =
                                    coupon.type?.toLowerCase() == 'premium';

                                return Text(
                                  (token == null || token.isEmpty) && isPremium
                                      ? "get_code".tr
                                      : "code_copied".tr,
                                );
                              }),
                            ),
                          ],
                        ),
                      ),

                      // Container(
                      //   padding: EdgeInsets.symmetric(
                      //       horizontal: 12.w, vertical: 10.h),
                      //   decoration: BoxDecoration(
                      //     color: Colors.white.withOpacity(0.2),
                      //     borderRadius: BorderRadius.circular(8),
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Text("coupon_code".tr, // Dynamic translation for "Coupon Code"
                      //               style: h5.copyWith(color: AppColors.white)),
                      //           sh5,
                      //           Text(
                      //             coupon.code ?? '',
                      //             style: h3.copyWith(
                      //                 color: AppColors.white, fontSize: 18),
                      //           ),
                      //         ],
                      //       ),
                      //       ElevatedButton(
                      //         style: ElevatedButton.styleFrom(
                      //           backgroundColor: AppColors.white,
                      //           foregroundColor: AppColors.black,
                      //         ),
                      //         onPressed: () {
                      //           if (coupon.code != null) {
                      //             Clipboard.setData(
                      //                 ClipboardData(text: "${coupon.code}"));
                      //             Get.snackbar("Copied",
                      //                 "Coupon already copied to clipboard");
                      //           }
                      //         },
                      //         child: const Text("Code Copied"),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      sh12,
                      Text(
                        coupon.validity != null
                            ? "${'valid_till'.tr} ${DateHelper.formatDate(coupon.validity.toString())}" // Dynamic translation for "Valid till"
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
                text: "continue_to_store".tr,
                // Dynamic translation for "Continue To Store"
                onPressed: () async {
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

              /// How to Use
              sectionTitle("how_to_use".tr),
              // Dynamic translation for "How to Use"
              sh8,
              for (int i = 0; i < coupon.howToUse.length; i++)
                stepItem(coupon.howToUse[i], i + 1),

              sh20,

              /// Terms & Conditions
              sectionTitle("terms_conditions".tr),
              // Dynamic translation for "Terms & Conditions"
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
                    Text('user_rate'.tr, // Dynamic translation for "User Rate"
                        style: h3.copyWith(color: AppColors.darkGreen)),
                    sh12,
                    Text(
                      "${coupon.fakeUses ?? 0} ${'times_copied'.tr}",
                      // Dynamic translation for "{number} Times copied"
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
