import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_coupon/common/app_color/app_colors.dart';
import '../../../../common/helper/offer_card.dart';
import '../../../data/dummy_data.dart';

class FavouriteView extends GetView {


  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text('FavouriteView'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: DummyData.offers.length,
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
              onFavoriteTap: () {
                // 🔹 Handle favorite toggle
              },
              onButtonTap: () {
                // 🔹 Handle Get Code button
              },
            ),
          );
        },
      ),
    );
  }
}
