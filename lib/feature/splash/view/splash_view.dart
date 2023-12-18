import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  final controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Image.asset(
              "assets/images/starforce.png",
            ),
          ),
        );
  }
}
