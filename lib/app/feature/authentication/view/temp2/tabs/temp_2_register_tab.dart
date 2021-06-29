import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/base/view/widgets/button/raised_gradient_button.dart';
import '../../../../../core/base/view/widgets/container/space.dart';
import '../../../../../core/base/view/widgets/text/input_text.dart';
import '../../../../../core/base/view/widgets/text/title_text.dart';
import '../../../../../core/style/app_color.dart';
import '../../../../../core/style/app_text_style.dart';
import '../../../../../core/translation/localization_key.dart';
import '../../../../../core/util/ui_helper.dart';
import '../../../controller/register/register_controller.dart';


class Temp2RegisterTab extends GetView<RegisterController> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: UIHelper.Space72.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TitleText(title: LocalizationKey.Register.tr),
              InputText(
                labelText: LocalizationKey.Name.tr,
                textEditingController: controller.nameController,
                currentFocusNode: controller.nameFocus,
                nextFocusNode: controller.surnameFocus,
                textInputType: TextInputType.name,
              ),
              Space(height: UIHelper.Space100.h),
              InputText(
                labelText: LocalizationKey.Surname.tr,
                textEditingController: controller.surnameController,
                currentFocusNode: controller.surnameFocus,
                nextFocusNode: controller.emailFocus,
                textInputType: TextInputType.name,
              ),
              Space(height: UIHelper.Space100.h),
              InputText(
                labelText: LocalizationKey.Email.tr,
                textEditingController: controller.emailController,
                currentFocusNode: controller.emailFocus,
                nextFocusNode: controller.phoneFocus,
                textInputType: TextInputType.emailAddress,
              ),
              Space(height: UIHelper.Space100.h),
              InputText(
                labelText: LocalizationKey.Phone.tr,
                textEditingController: controller.phoneController,
                currentFocusNode: controller.phoneFocus,
                nextFocusNode: controller.passwordFocus,
                textInputType: TextInputType.phone,
                inputFormatters: [controller.inputFormatter],
              ),
              Space(height: UIHelper.Space100.h),
              Obx(() => InputText(
                    textEditingController: controller.passwordController,
                    labelText: LocalizationKey.Password.tr,
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
              Space(height: UIHelper.Space200.h),
              ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: RaisedGradientButton(
                    height: UIHelper.Space200.h,
                    child: Text(LocalizationKey.Register.tr.toUpperCase(),
                        style: loginButtonStyle),
                    gradient: LinearGradient(
                      colors: loginButtonGradient,
                    ),
                    onPressed: controller.registerTapped,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
