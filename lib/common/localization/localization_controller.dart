import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../helper/local_store.dart';

class LocalizationController extends GetxController {
  var selectedLanguage = 'English'.obs;

  @override
  void onInit() {
    super.onInit();
    loadSavedLanguage();
  }

  // Load saved language from GetStorage
  Future<void> loadSavedLanguage() async {
    final savedLanguage = LocalStorage.getData(key: 'language') ?? 'English';
    selectedLanguage.value = savedLanguage;
    _updateLocale(savedLanguage);
    print("Loaded language: $savedLanguage");  // Debug: check which language is loaded
  }

  // Change language and save it to GetStorage
  Future<void> changeLanguage(String language) async {
    selectedLanguage.value = language;
    await LocalStorage.saveData(key: 'language', data: language);
    _updateLocale(language);
  }

  // Update the GetX locale
  void _updateLocale(String language) {
    Locale locale;
    switch (language) {
      case 'Arabic':
        locale = const Locale('ar', 'SA');
        break;
      default:
        locale = const Locale('en', 'US');
    }
    Get.updateLocale(locale);
    print("Updated locale to: $language");  // Debug: check which locale is set
  }

  // Get current locale
  Locale getCurrentLocale() {
    switch (selectedLanguage.value) {
      case 'Arabic':
        return const Locale('ar', 'SA');
      default:
        return const Locale('en', 'US');
    }
  }
}
