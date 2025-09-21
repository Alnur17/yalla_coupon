import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yalla_coupon/common/app_constant/app_constant.dart';
import 'package:yalla_coupon/common/app_images/app_images.dart';
import 'package:yalla_coupon/app/data/api.dart';
import 'package:yalla_coupon/app/data/base_client.dart';

import '../../../../common/helper/local_store.dart';
import '../model/profile_model.dart';

class ProfileController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  // For profile image
  Rx<File?> selectedImage = Rx<File?>(null);
  RxString profileImageUrl = AppImages.profileImage.obs;

  // For user profile data
  Rx<ProfileModel?> profileData = Rx<ProfileModel?>(null);
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  /// Pick image from gallery
  Future<void> pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  /// Save changes (UI only for now)
  void saveProfileChanges() {
    if (selectedImage.value != null) {
      profileImageUrl.value = selectedImage.value!.path;
      // You can also call an API here to upload image
    }
  }

  /// === API call to get user profile ===
  Future<void> fetchProfile() async {
    try {
      isLoading.value = true;
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${LocalStorage.getData(key: AppConstant.token)}',
      };

      final response = await BaseClient.getRequest(
        api: Api.userProfile,
        headers: headers,
      );

      final data = await BaseClient.handleResponse(response);

      // Parse into ProfileModel
      profileData.value = ProfileModel.fromJson(data);

      // Set image url if any
      if (profileData.value?.data?.user?.image != null) {
        profileImageUrl.value = profileData.value!.data!.user!.image.toString();
      }

    } catch (e) {
      print("Profile fetch error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
