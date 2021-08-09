import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:networking/networking/network_listener.dart';

import '../../../../core/base/controller/base_controller.dart';
import '../../../../core/model/auth/request/login_request.dart';
import '../../../../core/route/app_pages.dart';
import '../../repository/authentication_repository.dart';

class LoginController extends BaseController {
  final ScrollController scrollController = ScrollController();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final TextEditingController emailController =
      TextEditingController(text: "adminuser@kocsistem.com.tr");
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey =
      GlobalKey<FormState>(debugLabel: "_loginFormKey");
  final loginKey = GlobalKey<ScaffoldState>(debugLabel: "_loginKey");

  RxBool isPasswordObscure = true.obs;

  AuthenticationRepository _repository;

  LoginController(this._repository);

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

        loginRequest.email = emailController.text;
        loginRequest.password = passwordController.text;
        await _repository.login(
            loginRequest: loginRequest,
            listener: NetworkListener()
              ..onSuccess((dynamic result) {
                this.hideProgressBar();
                this.navigateOffView(path: AppRoutes.home);
              })
              ..onError((dynamic error) {
                clearForm();
                this.hideProgressBar();
                loginError(error);
              }));
      }
    });
  }

  void loginError(dynamic error) {
    try {
      this.showSnackBar(content: error.data.message);
    } catch (e) {
      this.showSnackBar(content: "Login error");
    }
  }

  void clearForm() {
    emailController.clear();
    passwordController.clear();
  }
}
