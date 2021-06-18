import 'package:get/get.dart';

import '../../../controller/resend/sms/temp_1_sms_controller.dart';

class Temp1SmsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Temp1SmsController>(() => Temp1SmsController());
  }
}
