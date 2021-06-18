import 'package:flutter/material.dart';
import 'package:flutter_provider/app/core/style/app_colors.dart';
import 'package:flutter_provider/app/core/style/app_text_styles.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../core/base/view/widgets/button/raised_gradient_button.dart';
import '../controller/select_template_controller.dart';

class SelectTemplateView extends GetView<SelectTemplateController> {
  final controller = Get.find();

  ClipRRect buildClipRRect({String? text, VoidCallback? click}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: RaisedGradientButton(
        height: 360,
        child: Text(
          text!,
          style: loginButtonStyle2,
          textAlign: TextAlign.center,
        ),
        gradient: LinearGradient(
          colors: selectTempButtonGradient,
        ),
        onPressed: click!,
      ),
    );
  }

  Widget get _lottieView => Lottie.asset(
        "assets/gif/line2.json",
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: buildClipRRect(
                text: "OneFrame Template 1",
                click: controller.template1Tapped,
              ),
            ),
            _lottieView,
            Flexible(
              child: buildClipRRect(
                text: "OneFrame Template 2",
                click: controller.template2Tapped,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
