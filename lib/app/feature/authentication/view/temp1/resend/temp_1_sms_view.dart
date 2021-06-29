import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/base/view/widgets/button/raised_gradient_button.dart';
import '../../../../../core/base/view/widgets/container/space.dart';
import '../../../../../core/base/view/widgets/material/shadow.dart';
import '../../../../../core/base/view/widgets/stack/nested_stack.dart';
import '../../../../../core/base/view/widgets/text/title_text.dart';
import '../../../../../core/style/app_color.dart';
import '../../../../../core/style/app_decoration.dart';
import '../../../../../core/style/app_text_style.dart';
import '../../../../../core/translation/localization_key.dart';
import '../../../../../core/util/ui_helper.dart';
import '../../../controller/resend/sms_controller.dart';

class Temp1SmsView extends GetView<SmsController> {

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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: UIHelper.Space72.w),
        child: Column(
          children: <Widget>[
            TitleText(
              title: LocalizationKey.RenewPasswordWithPhone.tr,
              description:
                  "Lorem ipsum dolor sit amet, consetetursadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea",
              titleStyle: titleNormalTextStyle,
            ),
            Space(height: UIHelper.Space100.h),
            Form(
              child: Shadow(
                child: TextFormField(
                  decoration: decoration(LocalizationKey.Phone.tr),
                ),
              ),
            ),
            Space(height: UIHelper.Space100.h),
            RaisedGradientButton(
              child: Text(LocalizationKey.SendSms.tr, style: loginButtonStyle),
              gradient: LinearGradient(
                colors: forgotSMSButtonGradient,
              ),
              leftIcon: Icons.chat_bubble_outline,
              onPressed: controller.smsTapped,
            ),
          ],
        ),
      ),
    );
  }
}
