import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base/view/widgets/button/raised_gradient_button.dart';
import '../../../../core/base/view/widgets/button/social_button.dart';
import '../../../../core/base/view/widgets/container/space.dart';
import '../../../../core/base/view/widgets/material/shadow.dart';
import '../../../../core/base/view/widgets/text/title_text.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_decorations.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../../core/util/validator_helper.dart';
import '../../controller/login/temp_1_login_controller.dart';

class Temp1LoginTab extends GetView<Temp1LoginController> {
  final controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TitleText(
                title: "HOŞGELDİNİZ",
              ),
              Form(
                key: controller.loginFormKey,
                child: Column(
                  children: <Widget>[
                    Shadow(
                      child: TextFormField(
                        controller: controller.emailController,
                        decoration: decoration("E-Posta"),
                        validator: ValidatorHelper.emptyControl,
                      ),
                    ),
                    Space(height: 50),
                    Shadow(
                      child: Obx(() => TextFormField(
                          obscureText: controller.isPasswordObscure.value,
                          controller: controller.passwordController,
                          decoration: decoration(
                            "Şifre",
                            suffix: InkWell(
                              onTap: controller.changeVisibility,
                              child: Icon(
                                controller.isPasswordObscure.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          validator: ValidatorHelper.emptyControl)),
                    ),
                    Space(height: 50),
                    RaisedGradientButton(
                      child: Text(
                        'GİRİŞ',
                        style: loginButtonStyle,
                      ),
                      gradient: LinearGradient(
                        colors: loginButtonGradient,
                      ),
                      onPressed: controller.loginTapped,
                    ),
                    Space(height: 30),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: controller.navigateForgotPasswordView,
                        child: Text("Şifremi Unuttum", style: forgotTextStyle),
                      ),
                    ),
                    Space(height: 50),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                            flex: 2,
                            child: Divider(
                              height: 4,
                              color: underlineColor,
                            )),
                        Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              "veya",
                              textAlign: TextAlign.center,
                              style: forgotTextStyle,
                            )),
                        Flexible(
                            flex: 2,
                            child: Divider(
                              height: 4,
                              color: underlineColor,
                            ))
                      ],
                    ),
                    Space(height: 30),
                    SocailButton(
                      onGooglePressed: null,
                      onFacebookPressed: null,
                      onTwitterPressed: null,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
