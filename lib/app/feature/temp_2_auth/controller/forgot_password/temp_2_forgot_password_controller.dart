import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/base/controller/base_controller.dart';
import '../../../../core/route/app_pages.dart';

class Temp2ForgotPasswordController extends BaseController {
  Future<void> navigateToEmailView() async {
    FocusScope.of(currentContext).unfocus();
    await Get.toNamed(AppRoutes.temp2Email);
  }

  Future<void> navigateToSmsView() async {
    FocusScope.of(currentContext).unfocus();
    await Get.toNamed(AppRoutes.temp2Sms);
  }

  void sendMail() async {
    String url = "mailto:starforce@starforce.com";
    if (await canLaunch(url)) {
      await launch(url);
    } else {}
  }
}
