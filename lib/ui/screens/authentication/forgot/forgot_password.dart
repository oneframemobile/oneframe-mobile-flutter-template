import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_provider/core/base/baseview.dart';
import 'package:flutter_provider/core/viewmodel/forgot_password_view_model.dart';
import 'package:flutter_provider/ui/shared/styles/colors/colors.dart';
import 'package:flutter_provider/ui/shared/styles/text/styles.dart';
import 'package:flutter_provider/ui/shared/widgets/button/raised_button.dart';
import 'package:flutter_provider/ui/shared/widgets/view/empty_view.dart';
import 'package:flutter_provider/ui/shared/widgets/view/nested_stack.dart';
import 'package:flutter_provider/ui/shared/widgets/view/title_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordView extends StatefulWidget {
  ForgotPasswordView({Key key}) : super(key: key);

  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  ForgotPasswordViewModel _forgotPasswordViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<ForgotPasswordViewModel>(
      onModelReady: (model) {
        _forgotPasswordViewModel = model;
        _forgotPasswordViewModel.setContext(context);
      },
      builder: (context, model, child) {
        return mainContent(context);
      },
    );
  }

  Scaffold mainContent(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ScreenUtil.instance.setHeight(600)),
        child: AppBar(
          backgroundColor: Colors.transparent,
          flexibleSpace: NestedStackWidget(
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
            TitleWidget(
              title: "Şifre Hatırlatma",
              titleStyle: titleNormalTextStyle,
              description: "Lorem ipsum dolor sit amet, consetetur sadipscing consetetur. Consetetur dolor sit amet, sed diam nonumy",
            ),
            SpaceView(
              height: 50,
            ),
            Text("ipsum dolor sit amet, consetetur "),
            SpaceView(
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
                      onPressed: () {
                        _forgotPasswordViewModel.goEmailView();
                      })),
            ),
            SpaceView(
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
                      onPressed: () {
                        _forgotPasswordViewModel.goSmsView();
                      })),
            ),
            Flexible(
              flex: 1,
              child: SafeArea(
                minimum: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(style: hyperTextStyle, text: "Eğer farklı bir işleminiz varsa, admine ulaşmak için "),
                      TextSpan(style: hyperBlueTextStyle, text: "e-posta ", recognizer: TapGestureRecognizer()..onTap = () => _forgotPasswordViewModel.sendMail()),
                      TextSpan(style: hyperTextStyle, text: " gönderebilirsiniz.")
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
