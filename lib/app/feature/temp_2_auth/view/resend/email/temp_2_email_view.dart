import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/base/view/widgets/button/raised_gradient_button.dart';
import '../../../../../core/base/view/widgets/container/space.dart';
import '../../../../../core/base/view/widgets/text/input_text.dart';
import '../../../../../core/base/view/widgets/text/title_text.dart';
import '../../../../../core/style/app_colors.dart';
import '../../../../../core/style/app_text_styles.dart';
import '../../../controller/resend/email/temp_2_email_controller.dart';

class Temp2EmailView extends GetView<Temp2EmailController> {
  final controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("E-Posta ile Sifre Yenileme"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            TitleText(
              title: "E-Posta ile Sifre Yenileme",
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
                labelText: "E-Posta",
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
              ),
            ),
            Space(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
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
                  onPressed: controller.emailTapped,
                ),
              ),
            ),
            Space(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
