
import '../../common/app_images/app_images.dart';

class DummyData {
  static final List<Map<String, dynamic>> offers = [
    {
      'title': '20% OFF Everything',
      'subtitle': 'Amazon',
      'image': AppImages.offerImage,
      'validTill': 'Aug 16, 2025',
      'usageCount': '2.3K',
      'isFavorite': true,
    },
    {
      'title': '50% OFF on Electronics',
      'subtitle': 'eBay',
      'image': AppImages.offerImage,
      'validTill': 'Sep 10, 2025',
      'usageCount': '1.5K',
      'isFavorite': false,
    },
    {
      'title': '10% OFF Grocery',
      'subtitle': 'Walmart',
      'image': AppImages.offerImage,
      'validTill': 'Oct 5, 2025',
      'usageCount': '3.1K',
      'isFavorite': false,
    },
  ];
}
