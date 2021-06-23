import 'package:flutter/material.dart';
import 'package:flutter_provider/app/core/translation/localization_key.dart';
import 'package:flutter_provider/app/core/util/ui_helper.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/base/view/widgets/button/raised_gradient_button.dart';
import '../../../../../core/base/view/widgets/container/space.dart';
import '../../../../../core/base/view/widgets/text/input_text.dart';
import '../../../../../core/base/view/widgets/text/title_text.dart';
import '../../../../../core/style/app_color.dart';
import '../../../../../core/style/app_text_style.dart';
import '../../../controller/resend/sms/temp_2_sms_controller.dart';

class Temp2SmsView extends GetView<Temp2SmsController> {
  final controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          LocalizationKey.RenewPasswordWithPhone.tr,
          style: titleNormalTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: UIHelper.Space50.w),
        child: Column(
          children: <Widget>[
            TitleText(
              title: LocalizationKey.RenewPasswordWithPhone.tr,
              description:
                  "Lorem ipsum dolor sit amet, consetetursadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea",
              titleStyle: titleNormalTextStyle,
            ),
            Space(height: UIHelper.Space600.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: UIHelper.Space60.w),
              child: InputText(
                labelText: LocalizationKey.Phone.tr,
                textInputAction: TextInputAction.done,
                inputFormatters: [controller.inputFormatter],
              ),
            ),
            Space(height: UIHelper.Space300.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: UIHelper.Space60.w),
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
                  onPressed: controller.smsTapped,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
