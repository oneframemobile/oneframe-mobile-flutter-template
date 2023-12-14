import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '/core/base/controller/base_controller.dart';

class SmsController extends BaseController {
  final inputFormatter = new MaskTextInputFormatter(
      mask: '(###) ### ## ##', filter: {"#": RegExp(r'[0-9]')});

  void smsTapped() {
    Get.back();
    Get.back();
  }
}
