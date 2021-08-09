import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:networking/networking.dart';

import '../../../../core/base/controller/base_controller.dart';
import '../../../../core/model/auth/request/register_request.dart';
import '../../../../core/route/app_pages.dart';
import '../../repository/authentication_repository.dart';

class RegisterController extends BaseController {
  final FocusNode nameFocus = FocusNode();
  final FocusNode surnameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final registerKey = GlobalKey<ScaffoldState>(debugLabel: "_registerKey");
  final inputFormatter = MaskTextInputFormatter(
      mask: '(###) ### ## ##', filter: {"#": RegExp(r'[0-9]')});

  RxBool isPasswordObscure = true.obs;
  AuthenticationRepository _repository;

  RegisterController(this._repository);

  void changeVisibility() {
    isPasswordObscure.value = !isPasswordObscure.value;
  }

  bool isKeyboardOpen() {
    return MediaQuery.of(currentContext).viewInsets.bottom != 0;
  }

  Future<void> registerTapped() async {
    this.showProressBar();

    if (nameController.text.isEmpty ||
        surnameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty) {
      this.hideProgressBar();
      this.showSnackBar(content: "Tüm alanları doldurun");
    } else {
      Future.delayed(Duration(seconds: 1), () async {
        RegisterRequest registerRequest = RegisterRequest();

        registerRequest.name = nameController.text;
        registerRequest.surname = surnameController.text;
        registerRequest.email = emailController.text;
        registerRequest.phoneNumber = phoneController.text;
        registerRequest.password = passwordController.text;

        await _repository.register(
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
