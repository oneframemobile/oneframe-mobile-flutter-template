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
}
