import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../common/app_color/app_colors.dart';
import '../../../../../common/app_text_style/styles.dart';
import '../../../../common/app_images/app_images.dart';
import '../../../../common/widgets/custom_circular_container.dart';

class FaqView extends GetView {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> faqList = [
      {
        "question": "How do I reset my password?",
        "answer":
        "To reset your password, go to the login page and click 'Forgot Password'. Enter your email address and we'll send you a reset link within a few minutes."
      },
      {
        "question": "How do I copy a coupon code?",
        "answer":
        "Tap on any coupon to automatically copy the code to your clipboard. You'll see a confirmation message when it's copied successfully."
      },
      {
        "question": "Do coupons expire?",
        "answer":
        "Yes, each coupon has an expiration date shown on the coupon card. Expired coupons cannot be used."
      },
      {
        "question": "How do I update the app?",
        "answer":
        "Go to your device's app store, search for our app, and tap 'Update' if available. Enable automatic updates for the best experience."
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text(
          'FAQ',
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: CustomCircularContainer(
            imagePath: AppImages.back,
            onTap: () {
              Get.back();
            },
            padding: 2,
          ),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(20.w),
        itemCount: faqList.length,
        separatorBuilder: (context, index) =>
        const Divider(thickness: 1, color: Colors.grey),
        itemBuilder: (context, index) {
          return _FaqItem(
            question: faqList[index]["question"]!,
            answer: faqList[index]["answer"]!,
          );
        },
      ),
    );
  }
}

class _FaqItem extends StatefulWidget {
  final String question;
  final String answer;

  const _FaqItem({
    required this.question,
    required this.answer,
  });

  @override
  State<_FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<_FaqItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.question,
                  style: h4.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Icon(
                isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: Colors.black54,
              ),
            ],
          ),
        ),
        if (isExpanded) ...[
          SizedBox(height: 8.h),
          Text(
            widget.answer,
            style: h5.copyWith(color: Colors.black54),
          ),
        ],
      ],
    );
  }
}
