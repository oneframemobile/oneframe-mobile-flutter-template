import 'package:get/get.dart';

import '../../service/api/api_service.dart';

class BaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiService>(() => ApiService());
  }
}
