import 'package:get/get.dart';

import '../../controller/forgot_password/temp_2_forgot_password_controller.dart';

class Temp2ForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Temp2ForgotPasswordController>(() => Temp2ForgotPasswordController());
  }
}
