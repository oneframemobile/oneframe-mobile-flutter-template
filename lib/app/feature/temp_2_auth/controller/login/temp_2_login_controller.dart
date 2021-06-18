import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base/controller/base_controller.dart';
import '../../../../core/route/app_pages.dart';

class Temp2LoginController extends BaseController {
  final ScrollController scrollController = ScrollController();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final loginKey = GlobalKey<ScaffoldState>(debugLabel: "_loginKey");

  RxBool isPasswordObscure = true.obs;

  void changeVisibility() {
    isPasswordObscure.value = !isPasswordObscure.value;
  }

  bool isKeyboardOpen() {
    return MediaQuery.of(currentContext).viewInsets.bottom != 0;
  }

  Future<void> navigateForgotPasswordView() async {
    FocusScope.of(currentContext).unfocus();
    await Get.toNamed(AppRoutes.temp2ForgotPassword);
  }

  Future<void> navigateToRegisterView() async {
    FocusScope.of(currentContext).unfocus();
    // TODO Navigate navigator.navigateTo(Pages.SignUp);
    print("navigate to temp 2 register view");
  }

  Future<void> loginTapped() async {
    this.showProressBar();
    await Future.delayed(Duration(seconds: 2));
    this.hideProgressBar();
    navigateToHomeView();
  }

  Future<void> navigateToHomeView() async {
    FocusScope.of(currentContext).unfocus();
    await Get.offNamed(AppRoutes.home);
  }
}
