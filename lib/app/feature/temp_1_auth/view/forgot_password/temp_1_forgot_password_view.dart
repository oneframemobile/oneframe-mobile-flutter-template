import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/base/view/widgets/button/raised_gradient_button.dart';
import '../../../../core/base/view/widgets/container/space.dart';
import '../../../../core/base/view/widgets/stack/nested_stack.dart';
import '../../../../core/base/view/widgets/text/title_text.dart';
import '../../../../core/style/app_colors.dart';
import '../../../../core/style/app_text_styles.dart';
import '../../../../core/util/ui_helper.dart';
import '../../controller/forgot_password/temp_1_forgot_password_controller.dart';

class Temp1ForgotPasswordView extends GetView<Temp1ForgotPasswordController> {
  final controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(UIHelper.Space600.h),
        child: AppBar(
          backgroundColor: Colors.transparent,
          flexibleSpace: NestedStack(
            backgroundImage: "assets/images/background.jpg",
            childImage: "assets/images/starforceW.png",
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TitleText(
              title: "Şifre Hatırlatma",
              titleStyle: titleNormalTextStyle,
              description:
                  "Lorem ipsum dolor sit amet, consetetursadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea",
            ),
            Space(height: 80),
            RaisedGradientButton(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'E-Posta ile Gonder',
                style: loginButtonStyle,
              ),
              gradient: LinearGradient(
                colors: forgotEMailButtonGradient,
              ),
              rightIcon: Icons.mail_outline,
              onPressed: controller.navigateToEmailView,
            ),
            Space(
              height: 80,
            ),
            RaisedGradientButton(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'SMS ile Gonder',
                style: loginButtonStyle,
              ),
              gradient: LinearGradient(
                colors: forgotSMSButtonGradient,
              ),
              rightIcon: Icons.chat_bubble_outline,
              onPressed: controller.navigateToSmsView,
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
                      TextSpan(style: hyperBlueTextStyle, text: "e-posta "),
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
