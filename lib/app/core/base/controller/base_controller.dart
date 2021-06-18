import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  BuildContext get currentContext =>
      Get.context != null ? Get.context! : Get.overlayContext!;

  void showProressBar() {
    showDialog(
      context: currentContext,
      barrierDismissible: false,
      builder: (_) => CircularProgressIndicator(),
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
}
