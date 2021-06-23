import 'package:get/get.dart';

import '../../../controller/resend/sms/temp_2_sms_controller.dart';

class Temp2SmsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Temp2SmsController>(() => Temp2SmsController());
  }
}
