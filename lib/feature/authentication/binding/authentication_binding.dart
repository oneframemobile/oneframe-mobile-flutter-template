import 'package:get/get.dart';

import '../../../services/api/oneframe_api_manager.dart';
import '../controller/authentication_controller.dart';
import '../controller/login/login_controller.dart';
import '../controller/register/register_controller.dart';
import '../repository/authentication_repository.dart';

class AuthenticationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationRepository>(
      () => AuthenticationRepository(
        Get.find<OneFrameApiManager>(),
      ),
    );
    Get.lazyPut<AuthenticationController>(
      () => AuthenticationController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(
        Get.find<AuthenticationRepository>(),
      ),
    );
    Get.lazyPut<RegisterController>(
      () => RegisterController(
        Get.find<AuthenticationRepository>(),
      ),
    );
  }
}
