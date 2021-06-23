import 'package:get/get.dart';

import '../../controller/forgot_password/temp_1_forgot_password_controller.dart';

class Temp1ForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Temp1ForgotPasswordController>(() => Temp1ForgotPasswordController());
  }
}
