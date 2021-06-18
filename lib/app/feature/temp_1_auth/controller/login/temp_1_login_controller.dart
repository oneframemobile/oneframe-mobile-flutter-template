import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:networking/networking/network_listener.dart';

import '../../../../core/base/controller/base_controller.dart';
import '../../../../core/model/auth/request/login_request.dart';
import '../../../../core/route/app_pages.dart';
import '../../../../core/service/api/api_service.dart';

class Temp1LoginController extends BaseController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey =
      GlobalKey<FormState>(debugLabel: "_loginFormKey");

  RxBool isPasswordObscure = true.obs;

  ApiService apiService;

  Temp1LoginController(this.apiService);

  void changeVisibility() {
    isPasswordObscure.value = !isPasswordObscure.value;
  }

  Future<void> loginTapped() async {
    this.showProressBar();

    Future.delayed(Duration(seconds: 1), () async {
      if (loginFormKey.currentState != null &&
          !loginFormKey.currentState!.validate()) {
        this.hideProgressBar();
      } else {
        LoginRequest loginRequest = LoginRequest();

        loginRequest.userName = emailController.text;
        loginRequest.password = passwordController.text;
        await apiService.login(
            loginRequest: loginRequest,
            listener: NetworkListener()
              ..onSuccess((dynamic result) {
                this.hideProgressBar();
                navigateToHomeView();
              })
              ..onError((dynamic error) {
                this.hideProgressBar();
                loginError(error);
              }));
      }
    });
  }

  Future<void> navigateToHomeView() async {
    FocusScope.of(currentContext).unfocus();
    await Get.offNamed(AppRoutes.home);
  }

   Future<void> navigateForgotPasswordView() async {
    FocusScope.of(currentContext).unfocus();
    await Get.toNamed(AppRoutes.temp1ForgotPassword);
  }

  void loginError(dynamic error) {
    try {
      this.showSnackBar(content: error.data.message);
    } catch (e) {
      this.showSnackBar(content: "Login error");
    }
  }
}
