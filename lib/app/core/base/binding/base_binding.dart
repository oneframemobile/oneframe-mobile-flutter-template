import 'package:get/get.dart';

import '../../../api/oneframe_api_manager.dart';
import '../../../feature/authentication/repository/authentication_repository.dart';

class BaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OneFrameApiManager>(() => OneFrameApiManager());
    Get.put<AuthenticationRepository>(
        AuthenticationRepository(Get.find<OneFrameApiManager>()));
  }
}
