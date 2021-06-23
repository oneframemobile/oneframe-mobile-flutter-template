import 'package:flutter_provider/app/core/style/app_theme.dart';
import 'package:get/get.dart';

import '../../../core/base/controller/base_controller.dart';
import '../../../core/route/app_pages.dart';

class SplashController extends BaseController {
  @override
  void onReady() async {
    await Future.delayed(Duration(seconds: 2));
    Get.changeTheme(darkThemeData);
    await Get.offNamed(AppRoutes.selectTemplate);
    super.onReady();
  }
}
