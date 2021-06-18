import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base/controller/base_controller.dart';
import '../../../../core/route/app_pages.dart';

class Temp1ForgotPasswordController extends BaseController {
  Future<void> navigateToSmsView() async {
    FocusScope.of(currentContext).unfocus();
    await Get.toNamed(AppRoutes.temp1Sms);
  }

  Future<void> navigateToEmailView() async {
    FocusScope.of(currentContext).unfocus();
    await Get.toNamed(AppRoutes.temp1Email);
  }
}
