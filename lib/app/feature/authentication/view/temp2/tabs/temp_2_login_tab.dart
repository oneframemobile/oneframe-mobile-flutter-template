import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/base/view/widgets/button/raised_gradient_button.dart';
import '../../../../../core/base/view/widgets/button/social_button.dart';
import '../../../../../core/base/view/widgets/container/space.dart';
import '../../../../../core/base/view/widgets/text/input_text.dart';
import '../../../../../core/base/view/widgets/text/title_text.dart';
import '../../../../../core/route/app_pages.dart';
import '../../../../../core/style/app_color.dart';
import '../../../../../core/style/app_text_style.dart';
import '../../../../../core/translation/localization_key.dart';
import '../../../../../core/util/ui_helper.dart';
import '../../../controller/login/login_controller.dart';

class Temp2LoginTab extends GetView<LoginController> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: UIHelper.Space72.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TitleText(title: LocalizationKey.Welcome.tr),
              Text(
                "Lorem ipsum dolor sit amet, consetetur sadipscing consetetur. Consetetur dolor sit amet, sed diam nonumy",
                style: TextStyle(fontSize: 12),
              ),
              Space(height: UIHelper.Space100.h),
              Column(
                children: <Widget>[
                  InputText(
                    textEditingController: controller.emailController,
                    labelText: LocalizationKey.Email.tr,
                    currentFocusNode: controller.emailFocus,
                    nextFocusNode: controller.passwordFocus,
                    leftIcon: Icons.email,
                    textInputType: TextInputType.emailAddress,
                  ),
                  Space(height: UIHelper.Space100.h),
                  Obx(() => InputText(
                        textEditingController: controller.passwordController,
                        labelText: LocalizationKey.Password.tr,
                        obscureText: controller.isPasswordObscure.value,
                        textInputType: TextInputType.visiblePassword,
                        currentFocusNode: controller.passwordFocus,
                        textInputAction: TextInputAction.done,
                        leftIcon: Icons.lock,
                        actionIconData: controller.isPasswordObscure.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        onActionCallback: () {
                          if (!controller.isKeyboardOpen()) {
                            controller.passwordFocus.unfocus();
                            controller.passwordFocus.canRequestFocus = false;
                          }
                          controller.changeVisibility();
                        },
                      )),
                  Space(height: UIHelper.Space100.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => controller.navigateToView(
                          path: AppRoutes.temp2ForgotPassword),
                      child: Text(LocalizationKey.ForgotPassword.tr,
                          style: forgotTextStyle),
                    ),
                  ),
                  Space(height: UIHelper.Space100.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(UIHelper.Radius60),
                    child: RaisedGradientButton(
                      height: UIHelper.Space150.h,
                      child: Text(
                        LocalizationKey.Login.tr.toUpperCase(),
                        style: loginButtonStyle,
                      ),
                      gradient: LinearGradient(
                        colors: loginButtonGradient,
                      ),
                      onPressed: controller.loginTapped,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: UIHelper.Space40.h),
                    child: Row(
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
                              LocalizationKey.Or.tr.toLowerCase(),
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
                  ),
                  SocailButton(
                    onGooglePressed: null,
                    onFacebookPressed: null,
                    onTwitterPressed: null,
                  ),
                  Space(height: UIHelper.Space100.h),
                  InkWell(
                    onTap: () {},
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: LocalizationKey.NoAccount.tr,
                        style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontSize: UIHelper.fontSize40.sp,
                        ),
                      ),
                      TextSpan(
                        text: LocalizationKey.CreateAccount.tr,
                        style: TextStyle(
                          color: blue,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          decoration: TextDecoration.underline,
                          fontSize: UIHelper.fontSize40.sp,
                        ),
                      ),
                    ])),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
