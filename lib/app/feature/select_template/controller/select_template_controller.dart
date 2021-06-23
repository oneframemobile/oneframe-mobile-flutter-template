import 'package:flutter/material.dart';
import 'package:flutter_provider/app/core/style/app_theme.dart';
import 'package:get/get.dart';

import '../../../core/base/controller/base_controller.dart';
import '../../../core/route/app_pages.dart';

class SelectTemplateController extends BaseController {
  Future<void> template1Tapped() async {
    await Get.toNamed(AppRoutes.temp1Auth);
  }

  Future<void> template2Tapped() async {
    await Get.toNamed(AppRoutes.temp2Auth);
  }

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
