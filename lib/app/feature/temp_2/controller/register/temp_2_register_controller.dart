import 'package:flutter/material.dart';
import 'package:flutter_provider/app/core/model/auth/request/register_request.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:networking/networking/network_listener.dart';

import '../../../../core/base/controller/base_controller.dart';
import '../../../../core/service/api/api_service.dart';

class Temp2RegisterController extends BaseController {
  final FocusNode nameFocus = FocusNode();
  final FocusNode surnameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final registerKey = GlobalKey<ScaffoldState>(debugLabel: "_registerKey");
  final inputFormatter = MaskTextInputFormatter(
      mask: '(###) ### ## ##', filter: {"#": RegExp(r'[0-9]')});

  RxBool isPasswordObscure = true.obs;
  String? errorMessage;

  ApiService apiService;

  Temp2RegisterController(this.apiService);

  void changeVisibility() {
    isPasswordObscure.value = !isPasswordObscure.value;
  }

  bool isKeyboardOpen() {
    return MediaQuery.of(currentContext).viewInsets.bottom != 0;
  }

  Future<void> registerTapped() async {
    this.showProressBar();

    if (!isFormValidated()) {
      this.hideProgressBar();
      this.showSnackBar(content: errorMessage ?? "Unknown Error");
    } else {
      Future.delayed(Duration(seconds: 1), () async {
        RegisterRequest registerRequest = RegisterRequest();

        registerRequest.name = nameController.text;
        registerRequest.surname = surnameController.text;
        registerRequest.email = emailController.text;
        registerRequest.phoneNumber = "0${inputFormatter.getUnmaskedText()}";
        registerRequest.password = passwordController.text;
        await apiService.register(
            registerRequest: registerRequest,
            listener: NetworkListener()
              ..onSuccess((dynamic result) {
                this.hideProgressBar();
                print("accounts/register onsuccess");
                Get.back();
              })
              ..onError((dynamic error) {
                this.hideProgressBar();
                print("accounts/register onerror");
              }));
      });
    }
  }

  bool isFormValidated() {
    if (nameController.text.isEmpty) {
      errorMessage = 'İsim alanı boş bırakılamaz.';
      return false;
    } else if (surnameController.text.isEmpty) {
      errorMessage = 'Soyisim alanı boş bırakılamaz.';
      return false;
    } else if (emailController.text.isEmpty) {
      errorMessage = 'Mail alanı boş bırakılamaz.';
      return false;
    } else if (phoneController.text.isEmpty) {
      errorMessage = 'Telefon alanı boş bırakılamaz.';
      return false;
    } else if (passwordController.text.isEmpty) {
      errorMessage = 'Şifre alanı boş bırakılamaz.';
      return false;
    }

    return true;
  }
}
