import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/base/view/widgets/button/raised_gradient_button.dart';
import '../../../../../core/base/view/widgets/container/space.dart';
import '../../../../../core/base/view/widgets/stack/nested_stack.dart';
import '../../../../../core/base/view/widgets/text/title_text.dart';
import '../../../../../core/route/app_pages.dart';
import '../../../../../core/style/app_color.dart';
import '../../../../../core/style/app_text_style.dart';
import '../../../../../core/translation/localization_key.dart';
import '../../../../../core/util/ui_helper.dart';
import '../../../controller/forgot_password/forgot_password_controller.dart';

class Temp1ForgotPasswordView extends GetView<ForgotPasswordController> {
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
            onPressed: Get.back,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: UIHelper.Space72.w),
        child: Column(
          children: <Widget>[
            TitleText(
              title: LocalizationKey.RemindPassword.tr,
              titleStyle: titleNormalTextStyle,
              description:
                  "Lorem ipsum dolor sit amet, consetetursadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea",
            ),
            Space(height: UIHelper.Space100.h),
            RaisedGradientButton(
              child:
                  Text(LocalizationKey.SendEmail.tr, style: loginButtonStyle),
              gradient: LinearGradient(
                colors: forgotEMailButtonGradient,
              ),
              leftIcon: Icons.mail_outline,
              onPressed: () =>
                  controller.navigateToView(path: AppRoutes.temp1Email),
            ),
            Space(height: UIHelper.Space100.h),
            RaisedGradientButton(
              child: Text(LocalizationKey.SendSms.tr, style: loginButtonStyle),
              gradient: LinearGradient(
                colors: forgotSMSButtonGradient,
              ),
              leftIcon: Icons.chat_bubble_outline,
              onPressed: () =>
                  controller.navigateToView(path: AppRoutes.temp1Sms),
            ),
            Flexible(
              flex: 1,
              child: SafeArea(
                minimum: EdgeInsets.fromLTRB(10, 0, 0, 10),
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
                          style: hyperTextStyle, text: " gönderebilirsiniz."),
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
