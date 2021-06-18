import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/base/view/widgets/button/raised_gradient_button.dart';
import '../../../../../core/base/view/widgets/container/space.dart';
import '../../../../../core/base/view/widgets/material/shadow.dart';
import '../../../../../core/base/view/widgets/stack/nested_stack.dart';
import '../../../../../core/base/view/widgets/text/title_text.dart';
import '../../../../../core/style/app_colors.dart';
import '../../../../../core/style/app_decorations.dart';
import '../../../../../core/style/app_text_styles.dart';
import '../../../../../core/util/ui_helper.dart';
import '../../../controller/resend/email/temp_1_email_controller.dart';

class Temp1EmailView extends GetView<Temp1EmailController> {
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
            childImage: "assets/images/starforceW.png",
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
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
              height: 80,
            ),
            Form(
              child: Shadow(
                child: TextFormField(
                  decoration: decoration(
                    "E-Posta",
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
            ),
            Space(
              height: 80,
            ),
            RaisedGradientButton(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'E-Posta  Gonder',
                style: loginButtonStyle,
              ),
              gradient: LinearGradient(
                colors: forgotEMailButtonGradient,
              ),
              rightIcon: Icons.mail_outline,
              onPressed: () {
                print('Welcome');
              },
            ),
            Space(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
