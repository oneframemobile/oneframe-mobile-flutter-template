import 'package:get/get.dart';

import '/services/analytics/analytics_keys.dart';
import '/core/base/controller/base_controller.dart';
import '/core/route/app_pages.dart';

class SplashController extends BaseController {
  @override
  void onReady() async {
    await Get.offNamed(AppRoutes.selectTemplate);
    this.logEventFirebaseAnalytics(key: AnalytcisKeys.splash);
    super.onReady();
  }
}
