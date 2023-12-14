import 'package:firebase_analytics/firebase_analytics.dart';
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

  void logEventFirebaseAnalytics({
    required String key,
    Map<String, Object?>? params,
  }) async {
    FirebaseAnalytics.instance.logEvent(name: key, parameters: params);
  }

  void hideProgressBar() {
    Navigator.of(currentContext).pop();
  }

  showSnackBar({required String content}) async {
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

  navigateToView({required String path}) async {
    FocusScope.of(currentContext).unfocus();
    await Get.toNamed(path);
  }

  navigateOffView({required String path}) async {
    FocusScope.of(currentContext).unfocus();
    await Get.offNamed(path);
  }

  bool isKeyboardOpen() {
    return MediaQuery.of(currentContext).viewInsets.bottom != 0;
  }
}
