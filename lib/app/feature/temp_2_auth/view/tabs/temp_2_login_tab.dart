import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/base/view/widgets/button/raised_gradient_button.dart';
import '../../../../core/base/view/widgets/button/social_button.dart';
import '../../../../core/base/view/widgets/container/space.dart';
import '../../../../core/base/view/widgets/stack/nested_stack.dart';
import '../../../../core/base/view/widgets/text/input_text.dart';
import '../../../../core/base/view/widgets/text/title_text.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../../core/util/ui_helper.dart';
import '../../controller/login/temp_2_login_controller.dart';


class Temp2LoginTab extends GetView<Temp2LoginController> {
  final controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: controller.loginKey,
        resizeToAvoidBottomInset: true,
        body: NestedScrollView(
          controller: controller.scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: controller.isKeyboardOpen()
                    ? UIHelper.Space0.h
                    : UIHelper.Space600.h,
                floating: true,
                pinned: true,
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: NestedStack(
                  backgroundImage: "assets/images/background.jpg",
                  childImage: "assets/images/starforce.png",
                ),
                backgroundColor: Colors.black,
              ),
            ];
          },
          body: _buildContent,
        ),
      ),
    );
  }

  Widget get _buildContent {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TitleText(
              title: "HOŞGELDİNİZ",
            ),
            Text(
              "Lorem ipsum dolor sit amet, consetetur sadipscing consetetur. Consetetur dolor sit amet, sed diam nonumy",
              style: TextStyle(fontSize: 12),
            ),
            Space(height: 50),
            Column(
              children: <Widget>[
                InputText(
                  textEditingController: controller.emailController,
                  labelText: "E-Posta",
                  currentFocusNode: controller.emailFocus,
                  nextFocusNode: controller.passwordFocus,
                  leftIcon: Icons.email,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(() => InputText(
                      textEditingController: controller.passwordController,
                      labelText: "Şifre",
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
                Space(height: 50),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => controller.navigateForgotPasswordView(),
                    child: Text("Şifremi Unuttum", style: forgotTextStyle),
                  ),
                ),
                Space(height: 30),
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: RaisedGradientButton(
                    height: 160,
                    child: Text(
                      'GİRİŞ',
                      style: loginButtonStyle,
                    ),
                    gradient: LinearGradient(
                      colors: loginButtonGradient,
                    ),
                    onPressed: () => controller.loginTapped(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
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
                            "ve ya",
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
                Space(height: 50),
                InkWell(
                  onTap: () => controller.navigateToRegisterView(),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Hesabın yok mu?",
                        style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontSize: 12)),
                    TextSpan(
                        text: " Hemen Üye Ol!",
                        style: TextStyle(
                            color: blue,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.underline,
                            fontSize: 12)),
                  ])),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
