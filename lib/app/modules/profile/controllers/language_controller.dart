import 'package:get/get.dart';

class LanguageController extends GetxController {
  /// store selected language
  var selectedLanguage = 'English'.obs;

  void selectLanguage(String lang) {
    selectedLanguage.value = lang;
  }
}
