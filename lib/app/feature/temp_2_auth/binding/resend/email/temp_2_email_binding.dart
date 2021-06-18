import 'package:get/get.dart';

import '../../../controller/resend/email/temp_2_email_controller.dart';

class Temp2EmailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Temp2EmailController>(() => Temp2EmailController());
  }
}
