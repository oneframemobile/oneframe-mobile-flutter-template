import 'package:get/get.dart';

import '../../controller/resend/sms_controller.dart';

class SmsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SmsController>(() => SmsController());
  }
}
