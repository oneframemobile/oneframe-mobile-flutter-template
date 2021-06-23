import 'package:get/get.dart';

import '../../../core/service/api/api_service.dart';
import '../controller/login/temp_2_login_controller.dart';
import '../controller/register/temp_2_register_controller.dart';
import '../controller/temp_2_auth_controller.dart';

class Temp2AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Temp2AuthController>(() => Temp2AuthController());
    Get.lazyPut<Temp2LoginController>(() => Temp2LoginController());
    Get.lazyPut<Temp2RegisterController>(
        () => Temp2RegisterController(Get.find<ApiService>()));
  }
}
