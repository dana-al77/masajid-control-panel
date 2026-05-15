import 'dart:ui';

import 'package:ecommaerce_course/core/constant/app_theme.dart';
import 'package:ecommaerce_course/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController{

  Locale? language;

  MyServices myServices =Get.find();
  ThemeData appTheme = themeEnglish;
  changedLang(String langcode)
  {
    Locale locale =Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ?themeArabic :themeEnglish ;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? shraedPrefLang =myServices.sharedPreferences.getString("lang");
    if(shraedPrefLang == "ar"){
      language =const Locale("ar");
      appTheme= themeArabic;
    }
    else if(shraedPrefLang == "en"){
      language =const Locale("en");
      appTheme=themeEnglish ;
    }
    else{
      language =Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}