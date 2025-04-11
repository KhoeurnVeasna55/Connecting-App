import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  var locale = const Locale('km').obs;

  void changeLanguage(String languageCode) {
    locale.value = Locale(languageCode);
  }
}
