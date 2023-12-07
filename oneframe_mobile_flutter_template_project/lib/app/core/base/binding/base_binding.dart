import 'package:get/get.dart';

import '../../../services/api/oneframe_api_manager.dart';

class BaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OneFrameApiManager>(
      () => OneFrameApiManager(),
      fenix: true,
    );
  }
}
