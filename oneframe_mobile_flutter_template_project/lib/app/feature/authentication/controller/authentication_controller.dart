import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oneframe_mobile_flutter_template_project/app/services/analytics/analytics_keys.dart';
import 'package:oneframe_mobile_flutter_template_project/app/services/analytics/analytics_service.dart';

import '../../../core/base/controller/base_controller.dart';

class AuthenticationController extends BaseController
    with SingleGetTickerProviderMixin {
  late ScrollController scrollController;
  late TabController tabController;

  @override
  void onInit() {
    scrollController = ScrollController();
    tabController = TabController(length: 2, vsync: this);
    AnalyticsService.logEventWithKey(key: AnalytcisKeys.authenticationScreen);

    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    tabController.dispose();
    super.onClose();
  }
}
