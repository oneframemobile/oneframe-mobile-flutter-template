import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/base/view/widgets/button/raised_gradient_button.dart';
import '../../../../../core/base/view/widgets/container/space.dart';
import '../../../../../core/base/view/widgets/material/shadow.dart';
import '../../../../../core/style/app_color.dart';
import '../../../../../core/style/app_decoration.dart';
import '../../../../../core/style/app_text_style.dart';
import '../../../../../core/translation/localization_key.dart';
import '../../../../../core/util/ui_helper.dart';
import '../../../controller/register/register_controller.dart';

class Temp1RegisterTab extends GetView<RegisterController> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: UIHelper.Space72.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Shadow(
                    child: TextFormField(
                      controller: controller.nameController,
                      decoration: decoration(LocalizationKey.Name.tr),
                    ),
                  ),
                  Space(height: UIHelper.Space100.h),
                  Shadow(
                    child: TextFormField(
                      controller: controller.surnameController,
                      decoration: decoration(LocalizationKey.Surname.tr),
                    ),
                  ),
                  Space(height: UIHelper.Space100.h),
                  Shadow(
                    child: TextFormField(
                      controller: controller.emailController,
                      decoration: decoration(LocalizationKey.Email.tr),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Space(height: UIHelper.Space100.h),
                  Shadow(
                    child: TextFormField(
                      controller: controller.phoneController,
                      decoration: decoration(LocalizationKey.Phone.tr),
                    ),
                  ),
                  Space(height: UIHelper.Space100.h),
                  Shadow(
                    child: Obx(() => TextFormField(
                          controller: controller.passwordController,
                          obscureText: controller.isPasswordObscure.value,
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
                        )),
                  ),
                  Space(height: UIHelper.Space100.h),
                  RaisedGradientButton(
                    child: Text(
                      LocalizationKey.Register.tr,
                      style: loginButtonStyle,
                    ),
                    gradient: LinearGradient(
                      colors: loginButtonGradient,
                    ),
                    onPressed: controller.registerTapped,
                  ),
                  Space(height: UIHelper.Space100.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
