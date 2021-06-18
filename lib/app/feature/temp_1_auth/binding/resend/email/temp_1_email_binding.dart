import 'package:get/get.dart';

import '../../../controller/resend/email/temp_1_email_controller.dart';

class Temp1EmailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Temp1EmailController>(() => Temp1EmailController());
  }
}
