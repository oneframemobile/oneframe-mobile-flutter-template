import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/base/controller/base_controller.dart';

class AuthenticationController extends BaseController with SingleGetTickerProviderMixin {
  late ScrollController scrollController;
  late TabController tabController;

  @override
  void onInit() {
    scrollController = ScrollController();
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    tabController.dispose();
    super.onClose();
  }
}
