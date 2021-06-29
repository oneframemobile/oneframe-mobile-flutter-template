import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/base/controller/base_controller.dart';
import '../../../core/style/app_theme.dart';

class SelectTemplateController extends BaseController {
  void onLocalizationTapped() {
    Get.updateLocale(Get.locale == Locale('en', 'US')
        ? Locale('tr', 'TR')
        : Locale('en', 'US'));
  }

  void onThemeTapped() {
    Get.changeTheme(Get.theme.brightness == Brightness.light
        ? darkThemeData
        : lightThemeData);
  }
}
