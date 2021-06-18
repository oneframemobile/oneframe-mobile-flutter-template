import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base/view/widgets/button/raised_gradient_button.dart';
import '../../../../core/base/view/widgets/container/space.dart';
import '../../../../core/base/view/widgets/material/shadow.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_decorations.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../controller/register/temp_1_register_controller.dart';

class Temp1RegisterTab extends GetView<Temp1RegisterController> {
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
              Column(
                children: <Widget>[
                  Shadow(
                    child: TextFormField(
                      controller: controller.nameController,
                      decoration: decoration("Ad"),
                    ),
                  ),
                  Space(height: 20),
                  Shadow(
                    child: TextFormField(
                      controller: controller.surnameController,
                      decoration: decoration("Soyad"),
                    ),
                  ),
                  Space(height: 20),
                  Shadow(
                    child: TextFormField(
                      controller: controller.mailController,
                      decoration: decoration("Email"),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Space(
                    height: 20,
                  ),
                  Shadow(
                    child: TextFormField(
                      controller: controller.phoneController,
                      decoration: decoration("Telefon"),
                    ),
                  ),
                  Space(
                    height: 20,
                  ),
                  Shadow(
                    child: Obx(() => TextFormField(
                          controller: controller.passwordController,
                          obscureText: controller.isPasswordObscure.value,
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
                        )),
                  ),
                  Space(
                    height: 20,
                  ),
                  RaisedGradientButton(
                    child: Text(
                            'Uye ol',
                            style: loginButtonStyle,
                          ),
                    gradient: LinearGradient(
                      colors: loginButtonGradient,
                    ),
                    onPressed: controller.registerTapped,
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
