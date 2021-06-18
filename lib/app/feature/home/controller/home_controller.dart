import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/base/controller/base_controller.dart';
import '../view/tabs/notification_tab.dart';
import '../view/tabs/dashboard_tab.dart';
import '../view/tabs/location_tab.dart';
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
  void onInit() {
    currentScreen = screenList.first;
    super.onInit();
  }

  void changeScreen({required int index}) {
    screenIndex.value = index;
    currentScreen = screenList[index];
  }

  String getTitle() {
    switch (screenIndex.value) {
      case 0: 
      return 'Anasayfa';        
      case 1: 
      return 'Bildirim';  
      case 2: 
      return 'Konum';        
      case 3: 
      return 'Ayarlar';   

      default:
      return 'Bilinmeyen';
    }
  }
}
