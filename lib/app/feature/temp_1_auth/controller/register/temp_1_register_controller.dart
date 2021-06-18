import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:networking/networking.dart';

import '../../../../core/base/controller/base_controller.dart';
import '../../../../core/model/auth/request/register_request.dart';
import '../../../../core/route/app_pages.dart';
import '../../../../core/service/api/api_service.dart';

class Temp1RegisterController extends BaseController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController mailController = TextEditingController();

  RxBool isPasswordObscure = true.obs;
  ApiService apiService;

  Temp1RegisterController(this.apiService);

  void changeVisibility() {
    isPasswordObscure.value = !isPasswordObscure.value;
  }

  Future<void> registerTapped() async {
    this.showProressBar();

    if (nameController.text.isEmpty ||
        surnameController.text.isEmpty ||
        mailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty) {
      this.hideProgressBar();
      this.showSnackBar(content: "Tüm alanları doldurun");
    } else {
      Future.delayed(Duration(seconds: 1), () async {
        RegisterRequest registerRequest = RegisterRequest();

        registerRequest.name = nameController.text;
        registerRequest.surname = surnameController.text;
        registerRequest.email = mailController.text;
        registerRequest.phoneNumber = phoneController.text;
        registerRequest.password = passwordController.text;

        await apiService.register(
            registerRequest: registerRequest,
            listener: NetworkListener()
              ..onSuccess((dynamic result) {
                this.hideProgressBar();
                print("accounts/register onsuccess");
                navigateToHomeView();
              })
              ..onError((dynamic error) {
                this.hideProgressBar();
                print("accounts/register onerror");
              }));
      });
    }
  }

  Future<void> navigateToHomeView() async {
    FocusScope.of(currentContext).unfocus();
    await Get.offNamed(AppRoutes.home);
  }
}
