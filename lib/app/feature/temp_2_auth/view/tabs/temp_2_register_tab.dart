import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/base/view/widgets/button/raised_gradient_button.dart';
import '../../../../core/base/view/widgets/container/space.dart';
import '../../../../core/base/view/widgets/stack/nested_stack.dart';
import '../../../../core/base/view/widgets/text/input_text.dart';
import '../../../../core/base/view/widgets/text/title_text.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../../core/util/ui_helper.dart';
import '../../controller/register/temp_2_register_controller.dart';

class Temp2RegisterTab extends GetView<Temp2RegisterController> {
  final controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: controller.registerKey,
        resizeToAvoidBottomInset: true,
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: controller.isKeyboardOpen()
                      ? UIHelper.Space0.h
                      : UIHelper.Space600.h,
                  floating: true,
                  pinned: true,
                  forceElevated: innerBoxIsScrolled,
                  flexibleSpace: controller.isKeyboardOpen()
                      ? Container(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 56),
                                child: Text(
                                  "Üye Ol",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              )),
                        )
                      : NestedStack(
                          backgroundImage: "assets/images/background.jpg",
                          childImage: "assets/images/starforce.png",
                        ),
                  backgroundColor: Colors.black,
                ),
              ];
            },
            body: _buildContent),
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
              title: "Üye Ol",
            ),
            InputText(
              labelText: "Ad",
              textEditingController: controller.nameController,
              currentFocusNode: controller.nameFocus,
              nextFocusNode: controller.surnameFocus,
              textInputType: TextInputType.name,
            ),
            Space(height: 40),
            InputText(
              labelText: "Soyad",
              textEditingController: controller.surnameController,
              currentFocusNode: controller.surnameFocus,
              nextFocusNode: controller.emailFocus,
              textInputType: TextInputType.name,
            ),
            Space(height: 40),
            InputText(
              labelText: "E-Posta",
              textEditingController: controller.emailController,
              currentFocusNode: controller.emailFocus,
              nextFocusNode: controller.phoneFocus,
              textInputType: TextInputType.emailAddress,
            ),
            Space(
              height: 40,
            ),
            InputText(
              labelText: "Telefon",
              textEditingController: controller.phoneController,
              currentFocusNode: controller.phoneFocus,
              nextFocusNode: controller.passwordFocus,
              textInputType: TextInputType.phone,
              inputFormatters: [controller.inputFormatter],
            ),
            Space(
              height: 40,
            ),
            Obx(() => InputText(
                  textEditingController: controller.passwordController,
                  labelText: "Şifre",
                  obscureText: controller.isPasswordObscure.value,
                  textInputType: TextInputType.visiblePassword,
                  currentFocusNode: controller.passwordFocus,
                  textInputAction: TextInputAction.done,
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
            Space(
              height: 120,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: RaisedGradientButton(
                  height: 160,
                  child: Text(
                    'ÜYE OL',
                    style: loginButtonStyle,
                  ),
                  gradient: LinearGradient(
                    colors: loginButtonGradient,
                  ),
                  onPressed: controller.registerTapped,
                )),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
