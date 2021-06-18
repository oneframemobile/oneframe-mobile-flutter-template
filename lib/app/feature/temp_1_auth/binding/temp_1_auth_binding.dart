import 'package:get/get.dart';

import '../../../core/service/api/api_service.dart';
import '../controller/login/temp_1_login_controller.dart';
import '../controller/register/temp_1_register_controller.dart';
import '../controller/temp_1_auth_controller.dart';

class Temp1AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Temp1AuthController>(
      () => Temp1AuthController(),
    );
    Get.lazyPut<Temp1LoginController>(
      () => Temp1LoginController(Get.find<ApiService>()),
    );
    Get.lazyPut<Temp1RegisterController>(
      () => Temp1RegisterController(Get.find<ApiService>()),
    );
  }
}
