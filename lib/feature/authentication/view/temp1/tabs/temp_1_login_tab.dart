import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/core/base/view/widgets/button/raised_gradient_button.dart';
import '/core/base/view/widgets/button/social_button.dart';
import '/core/base/view/widgets/container/space.dart';
import '/core/base/view/widgets/material/shadow.dart';
import '/core/base/view/widgets/text/title_text.dart';
import '/core/route/app_pages.dart';
import '/core/style/app_color.dart';
import '/core/style/app_decoration.dart';
import '/core/style/app_text_style.dart';
import '/core/translation/localization_key.dart';
import '/core/util/ui_helper.dart';
import '/core/util/validator_helper.dart';
import '../../../controller/login/login_controller.dart';

class Temp1LoginTab extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: UIHelper.Space120.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TitleText(title: LocalizationKey.Welcome.tr),
              Form(
                autovalidateMode: AutovalidateMode.disabled,
                key: controller.loginFormKey,
                child: Column(
                  children: <Widget>[
                    Shadow(
                      child: TextFormField(
                        controller: controller.emailController,
                        decoration: decoration(LocalizationKey.Email.tr),
                        validator: ValidatorHelper.emptyControl,
                      ),
                    ),
                    Space(height: UIHelper.Space200.h),
                    Shadow(
                      child: Obx(
                        () => TextFormField(
                          obscureText: controller.isPasswordObscure.value,
                          controller: controller.passwordController,
                          decoration: decoration(
                            LocalizationKey.Password.tr,
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
                          validator: ValidatorHelper.emptyControl,
                        ),
                      ),
                    ),
                    Space(height: UIHelper.Space250.h),
                    RaisedGradientButton(
                      height: UIHelper.Space150.h,
                      child: Text(
                        LocalizationKey.Login.tr.toUpperCase(),
                        style: loginButtonStyle,
                      ),
                      gradient: LinearGradient(colors: loginButtonGradient),
                      onPressed: controller.loginTapped,
                    ),
                    Space(height: UIHelper.Space200.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => controller.navigateToView(
                            path: AppRoutes.temp1ForgotPassword),
                        child: Text(LocalizationKey.ForgotPassword.tr,
                            style: forgotTextStyle),
                      ),
                    ),
                    Space(height: UIHelper.Space200.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: Divider(height: 4, color: underlineColor),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            LocalizationKey.Or.tr.toLowerCase(),
                            textAlign: TextAlign.center,
                            style: forgotTextStyle,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Divider(height: 4, color: underlineColor),
                        )
                      ],
                    ),
                    Space(height: UIHelper.Space200.h),
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
