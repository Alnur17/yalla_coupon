import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:yalla_coupon/common/app_constant/app_constant.dart';
import 'package:yalla_coupon/common/app_images/app_images.dart';
import 'package:yalla_coupon/app/data/api.dart';
import 'package:yalla_coupon/app/data/base_client.dart';

import '../../../../common/app_color/app_colors.dart';
import '../../../../common/helper/local_store.dart';
import '../../../../common/widgets/custom_snackbar.dart';
import '../model/profile_model.dart';

class ProfileController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  // For profile image
  Rx<File?> selectedImage = Rx<File?>(null);
  RxString profileImageUrl = AppImages.profileImage.obs;

  // For user profile data
  Rx<ProfileModel?> profileData = Rx<ProfileModel?>(null);
  RxBool isLoading = false.obs;

  final TextEditingController nameTEController = TextEditingController();
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController contactTEController = TextEditingController();


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

  Future<void> updateProfile({
    //required BuildContext context,
    required String name,
    required String email,
    required String age,
    required String contactNumber,
  })
  async {
    try {
      isLoading.value = true;
      String accessToken = LocalStorage.getData(key: AppConstant.token);
      if (accessToken.isEmpty) {
        kSnackBar(message: "User not authenticated", bgColor: AppColors.orange);
        return;
      }

      var request = http.MultipartRequest('PUT', Uri.parse(Api.editProfile));

      request.headers.addAll({
        'Authorization': accessToken,
        'Content-Type': 'multipart/form-data',
      });

      // Add JSON payload as text
      Map<String, dynamic> data = {
        "name": name,
        "email": email,
        "age": age,
        "contactNumber": contactNumber,
      };

      request.fields['data'] = jsonEncode(data);

      // Handle Image Upload
      if (selectedImage.value != null) {
        String imagePath = selectedImage.value!.path;
        String? mimeType = lookupMimeType(imagePath) ?? 'image/jpeg';

        request.files.add(
          await http.MultipartFile.fromPath(
            'image',
            imagePath,
            contentType: MediaType.parse(mimeType), //from http_parser package
          ),
        );
      }

      var response = await request.send();
      var responseData = await response.stream.bytesToString();

      try {
        var decodedResponse = json.decode(responseData);

        if (response.statusCode == 200) {
          kSnackBar(
              message: "Profile updated successfully",
              bgColor: AppColors.green);

          await fetchProfile();
          update();
          if (Get.context != null) {
            Navigator.pop(Get.context!);
          }
        } else {
          kSnackBar(
            message: decodedResponse['message'] ?? "Failed to update profile",
            bgColor: AppColors.orange,
          );
        }
      } catch (decodeError) {
        kSnackBar(
            message: "Invalid response format", bgColor: AppColors.orange);
        debugPrint("Response Error: $decodeError");
      }
    } catch (e) {
      kSnackBar(
          message: "Error updating profile: $e", bgColor: AppColors.orange);
      debugPrint("Update Error: $e");
    }finally {
      isLoading.value = false;
    }
  }
}
