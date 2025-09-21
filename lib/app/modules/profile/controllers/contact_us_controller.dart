import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/app_constant/app_constant.dart';
import '../../../../common/helper/local_store.dart';
import '../../../data/api.dart';
import '../../../data/base_client.dart';
import '../../../../common/app_color/app_colors.dart';
import '../../../../common/widgets/custom_snackbar.dart';

class ContactUsController extends GetxController {
  /// Text controllers for form fields
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  var isLoading = false.obs;

  Future<void> sendFeedback() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        subjectController.text.isEmpty ||
        messageController.text.isEmpty) {
      kSnackBar(message: "All fields are required", bgColor: AppColors.orange);
      return;
    }

    isLoading.value = true;

    try {
      final response = await BaseClient.postRequest(
        api: Api.contactUs,
        body: jsonEncode({
          "name": nameController.text.trim(),
          "email": emailController.text.trim(),
          "subject": subjectController.text.trim(),
          "message": messageController.text.trim(),
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${LocalStorage.getData(key: AppConstant.token)}',
        },
      );

      final data = await BaseClient.handleResponse(response);

      // success
      kSnackBar(message: data['message'] ?? "Feedback sent successfully!", bgColor: Colors.green);
      nameController.clear();
      emailController.clear();
      subjectController.clear();
      messageController.clear();
    } catch (e) {
      kSnackBar(message: e.toString(), bgColor: AppColors.orange);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    subjectController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
