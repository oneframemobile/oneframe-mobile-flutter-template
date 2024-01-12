import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oneframe_mobile_flutter_template_project/services/push/firebase_push_service.dart';

import '/services/analytics/analytics_keys.dart';
import '/core/base/controller/base_controller.dart';
import '/core/translation/localization_key.dart';
import '../view/tabs/dashboard_tab.dart';
import '../view/tabs/location_tab.dart';
import '../view/tabs/notification_tab.dart';
import '../view/tabs/setting_tab.dart';

class HomeController extends BaseController {
  final PageStorageBucket bucket = PageStorageBucket();
  final List<Widget> screenList = [
    DashboardTab(),
    NotificationTab(),
    LocationTab(),
    SettingTab(),
  ];

  RxInt screenIndex = 0.obs;

  late Widget currentScreen;

  @override
  void onInit() async {
    currentScreen = screenList.first;
    var token = await FirebasePushService.getToken();
    this.logEventFirebaseAnalytics(key: AnalyticsKeys.homeScreen);

    super.onInit();
    showSnackBar(content: "FCM TOKEN : $token");
  }

  void changeScreen({required int index}) {
    screenIndex.value = index;
    currentScreen = screenList[index];
  }

  String getTitle() {
    switch (screenIndex.value) {
      case 0:
        return LocalizationKey.Home.tr;
      case 1:
        return LocalizationKey.Notification.tr;
      case 2:
        return LocalizationKey.Location.tr;
      case 3:
        return LocalizationKey.Settings.tr;

      default:
        return LocalizationKey.Unknown.tr;
    }
  }
}
