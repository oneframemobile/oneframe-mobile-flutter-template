import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/base/view/widgets/button/raised_gradient_button.dart';
import '../../../../../core/base/view/widgets/container/space.dart';
import '../../../../../core/base/view/widgets/text/input_text.dart';
import '../../../../../core/base/view/widgets/text/title_text.dart';
import '../../../../../core/style/app_colors.dart';
import '../../../../../core/style/app_text_styles.dart';
import '../../../controller/resend/sms/temp_2_sms_controller.dart';

class Temp2SmsView extends GetView<Temp2SmsController> {
  final controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Sms ile Sifre Yenileme"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Column(
          children: <Widget>[
            TitleText(
              title: "Sms ile Sifre Yenileme",
              description:
                  "Lorem ipsum dolor sit amet, consetetursadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea",
              titleStyle: titleNormalTextStyle,
            ),
            Space(
              height: 200,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: InputText(
                labelText: "Telefon",
                textInputAction: TextInputAction.done,
                inputFormatters: [controller.inputFormatter],
              ),
            ),
            Space(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
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
