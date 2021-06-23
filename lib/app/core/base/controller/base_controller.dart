import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/components/custom_progress_bar.dart';

class BaseController extends GetxController {
  BuildContext get currentContext =>
      Get.context != null ? Get.context! : Get.overlayContext!;

  void showProressBar() {
    showDialog(
      context: currentContext,
      barrierDismissible: false,
      builder: (_) => CustomProgressBar(),
    );
  }

  void hideProgressBar() {
    Navigator.of(currentContext).pop();
  }

  Future<SnackBarClosedReason> showSnackBar({required String content}) async {
    return await ScaffoldMessenger.of(currentContext)
        .showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 5),
            content: Text(content),
          ),
        )
        .closed;
  }

  void back() {
    Get.back();
  }
}
