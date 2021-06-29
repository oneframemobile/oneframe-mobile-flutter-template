import 'package:get/get.dart';

import '../../controller/resend/email_controller.dart';

class EmailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmailController>(() => EmailController());
  }
}
