import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base/view/widgets/button/raised_gradient_button.dart';
import '../../../../core/base/view/widgets/container/space.dart';
import '../../../../core/base/view/widgets/stack/nested_stack.dart';
import '../../../../core/base/view/widgets/text/title_text.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../../core/util/ui_helper.dart';
import '../../controller/forgot_password/temp_2_forgot_password_controller.dart';

class Temp2ForgotPasswordView extends GetView<Temp2ForgotPasswordController> {
  final controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(UIHelper.Space600),
        child: AppBar(
          backgroundColor: Colors.transparent,
          flexibleSpace: NestedStack(
            backgroundImage: "assets/images/background.jpg",
            childImage: "assets/images/starforce.png",
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TitleText(
              title: "Şifre Hatırlatma",
              titleStyle: titleNormalTextStyle,
              description:
                  "Lorem ipsum dolor sit amet, consetetur sadipscing consetetur. Consetetur dolor sit amet, sed diam nonumy",
            ),
            Space(
              height: 50,
            ),
            Text("ipsum dolor sit amet, consetetur "),
            Space(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: RaisedGradientButton(
                  height: 140,
                  rightIcon: Icons.mail_outline,
                  child: Text(
                    'E-Posta Gönder',
                    style: loginButtonStyle,
                  ),
                  gradient: LinearGradient(
                    colors: forgotEMailButtonGradient,
                  ),
                  onPressed: controller.navigateToEmailView,
                ),
              ),
            ),
            Space(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: RaisedGradientButton(
                  height: 140,
                  rightIcon: Icons.sms,
                  child: Text(
                    'SMS Gönder',
                    style: loginButtonStyle,
                  ),
                  gradient: LinearGradient(
                    colors: forgotSMSButtonGradient,
                  ),
                  onPressed: controller.navigateToSmsView,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: SafeArea(
                minimum: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          style: hyperTextStyle,
                          text:
                              "Eğer farklı bir işleminiz varsa, admine ulaşmak için "),
                      TextSpan(
                          style: hyperBlueTextStyle,
                          text: "e-posta ",
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => controller.sendMail()),
                      TextSpan(
                          style: hyperTextStyle, text: " gönderebilirsiniz.")
                    ]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
