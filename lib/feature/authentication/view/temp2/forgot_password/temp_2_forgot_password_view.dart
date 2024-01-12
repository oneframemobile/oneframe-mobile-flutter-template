import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/core/base/view/widgets/button/raised_gradient_button.dart';
import '/core/base/view/widgets/container/space.dart';
import '/core/base/view/widgets/stack/nested_stack.dart';
import '/core/base/view/widgets/text/title_text.dart';
import '/core/route/app_pages.dart';
import '/core/style/app_color.dart';
import '/core/style/app_text_style.dart';
import '../../../../../core/localization/localization_key.dart';
import '/core/util/ui_helper.dart';
import '../../../controller/forgot_password/forgot_password_controller.dart';

class Temp2ForgotPasswordView extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(UIHelper.Space600.h),
        child: AppBar(
          backgroundColor: Colors.transparent,
          flexibleSpace: NestedStack(
            backgroundImage: "assets/images/background.jpg",
            childImage: "assets/images/starforce.png",
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TitleText(
              title: LocalizationKey.RemindPassword.tr,
              titleStyle: titleNormalTextStyle,
              description:
                  "Lorem ipsum dolor sit amet, consetetur sadipscing consetetur. Consetetur dolor sit amet, sed diam nonumy",
            ),
            Space(height: UIHelper.Space100.h),
            Text("ipsum dolor sit amet, consetetur "),
            Space(height: UIHelper.Space100.h),
            Padding(
              padding: EdgeInsets.all(UIHelper.Space50.r),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: RaisedGradientButton(
                  height: UIHelper.Space300.h,
                  leftIcon: Icons.mail_outline,
                  child: Text(LocalizationKey.SendEmail.tr,
                      style: loginButtonStyle),
                  gradient: LinearGradient(
                    colors: forgotEMailButtonGradient,
                  ),
                  onPressed: () =>
                      controller.navigateToView(path: AppRoutes.temp2Email),
                ),
              ),
            ),
            Space(height: UIHelper.Space100.h),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: RaisedGradientButton(
                  height: UIHelper.Space300.h,
                  leftIcon: Icons.sms,
                  child:
                      Text(LocalizationKey.SendSms.tr, style: loginButtonStyle),
                  gradient: LinearGradient(
                    colors: forgotSMSButtonGradient,
                  ),
                  onPressed: () =>
                      controller.navigateToView(path: AppRoutes.temp2Sms),
                ),
              ),
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
                      TextSpan(
                        style: hyperBlueTextStyle,
                        text: "e-posta ",
                        recognizer: TapGestureRecognizer()
                          ..onTap = controller.sendMail,
                      ),
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
