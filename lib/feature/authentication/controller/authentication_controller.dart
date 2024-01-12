import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/services/analytics/analytics_keys.dart';
import '/core/base/controller/base_controller.dart';

class AuthenticationController extends BaseController
    with SingleGetTickerProviderMixin {
  late ScrollController scrollController;
  late TabController tabController;

  @override
  void onInit() {
    scrollController = ScrollController();
    tabController = TabController(length: 2, vsync: this);
    this.logEventFirebaseAnalytics(key: AnalyticsKeys.authenticationScreen);

    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    tabController.dispose();
    super.onClose();
  }
}
