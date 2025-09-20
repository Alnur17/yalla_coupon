import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:yalla_coupon/common/app_color/app_colors.dart';
import 'package:yalla_coupon/common/app_text_style/styles.dart';
import 'package:yalla_coupon/common/size_box/custom_sizebox.dart';
import 'package:yalla_coupon/common/widgets/custom_button.dart';

import '../../../../common/app_images/app_images.dart';

class CouponsDetailsView extends StatefulWidget {
  const CouponsDetailsView({super.key});

  @override
  State<CouponsDetailsView> createState() => _CouponsDetailsViewState();
}

class _CouponsDetailsViewState extends State<CouponsDetailsView> {
  late Timer _timer;
  Duration _timeLeft =
      const Duration(days: 2, hours: 23, minutes: 45); // initial value

  @override
  void initState() {
    super.initState();
    _startCountdown();
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
            onTap: () {
              Get.back();
            },
            child: Image.asset(
              AppImages.back,
              scale: 4,
            ),
          ),
        ),
        title: Text(
          "Coupons Details",
          style: appBarStyle,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Limited Time Offer
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
                  Text(
                    "🔥 Limited Time Offer!",
                    style: h3.copyWith(
                      color: AppColors.darkRed,
                    ),
                  ),
                  sh5,
                  Text(
                    "Only 2 days left to grab this deal",
                    style: h5.copyWith(
                      color: AppColors.darkRed,
                    ),
                  ),
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
                  )
                ],
              ),
            ),
            SizedBox(height: 16.h),
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
                  // Logo + Title
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColors.white,
                        child: Image.asset(
                          AppImages.offerImage,
                          scale: 4,
                        ),
                      ),
                      sw8,
                      Text("Amazon",
                          style: h5.copyWith(color: AppColors.white)),
                    ],
                  ),
                  sh12,
                  Text(
                    "30% OFF Summer Collection",
                    style: h2.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    "Get amazing discounts on all fashion items",
                    style: h6.copyWith(color: AppColors.white),
                  ),
                  sh16,

                  // Coupon code
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
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
                            Text(
                              "Coupon Code",
                              style: h6,
                            ),
                            sh5,
                            Text(
                              "MYNTRA20",
                              style: h3.copyWith(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.black,
                            foregroundColor: AppColors.white,
                          ),
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: "MYNTRA20"));
                          },
                          child: const Text("COPY CODE"),
                        ),
                      ],
                    ),
                  ),
                  sh12,
                  Text(
                    "Valid till Aug 30",
                    style: h6.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            // Copy & Go button
            CustomButton(
              text: "COPY & GO TO STORE",
              onPressed: () {
                Clipboard.setData(ClipboardData(text: "MYNTRA20"));
              },
              backgroundColor: AppColors.transparent,
              borderColor: AppColors.orange,
              borderRadius: 12,
              textStyle: h3.copyWith(color: AppColors.orange),
            ),

            sh20,

            // How to Use
            sectionTitle("How to Use"),
            sh8,
            stepItem("Copy the coupon code above", 1),
            stepItem("Visit myntra.com and shop your favorites", 2),
            stepItem("Apply the code during checkout", 3),

            sh20,
            // Terms & Conditions
            sectionTitle("Terms & Conditions"),
            stepItem("Minimum order amount: ₹1,999", 1),
            stepItem("Valid on all categories except electronics", 2),
            stepItem("Not applicable on sale item", 3),
            stepItem("Cannot be combined with other offers", 4),

            sh20,

            // User Rate
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
                  Text(
                    'User Rate',
                    style: h3.copyWith(color: AppColors.darkGreen),
                  ),
                  sh12,
                  Text(
                    "2.3k Times copied this coupon",
                    style: h5.copyWith(color: AppColors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
          Text(
            value,
            style: h3.copyWith(color: AppColors.white),
          ),
          SizedBox(height: 4.h),
          Text(label, style: h6.copyWith(color: AppColors.white)),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: h3,
    );
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
              shape: CircleBorder(),
              gradient: LinearGradient(colors: AppColors.buttonColor),
            ),
            child: Center(
              child: Text(
                "$number",
                style: h6.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          sw10,
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
