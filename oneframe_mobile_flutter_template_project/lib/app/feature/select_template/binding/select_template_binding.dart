import 'package:get/get.dart';

import '../controller/select_template_controller.dart';

class SelectTemplateBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectTemplateController>(() => SelectTemplateController());
  }
}
