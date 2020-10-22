import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_provider/core/base/baseview.dart';
import 'package:flutter_provider/core/viewmodel/temp1_forgot_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_provider/shared/styles/colors/colors.dart';
import 'package:flutter_provider/shared/styles/text/styles.dart';
import 'package:flutter_provider/shared/widgets/button/raised_button.dart';
import 'package:flutter_provider/shared/widgets/view/empty_view.dart';
import 'package:flutter_provider/shared/widgets/view/nested_stack.dart';
import 'package:flutter_provider/shared/widgets/view/title_view.dart';

class Temp1ForgotView extends StatefulWidget {
  @override
  _Temp1ForgotViewState createState() => _Temp1ForgotViewState();
}

class _Temp1ForgotViewState extends State<Temp1ForgotView> {
  final String desc =
      "Lorem ipsum dolor sit amet, consetetursadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea";

  Temp1ForgotViewModel _temp1forgotViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<Temp1ForgotViewModel>(
      onModelReady: (model) {
        _temp1forgotViewModel = model;
        model.setContext(context);
      },
      builder: (context, model, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(ScreenUtil.instance.setHeight(600)),
            child: AppBar(
              backgroundColor: Colors.transparent,
              flexibleSpace: NestedStackWidget(
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
                TitleWidget(
                  title: "Şifre Hatırlatma",
                  titleStyle: titleNormalTextStyle,
                  description: this.desc,
                ),
                SpaceView(
                  height: 80,
                ),
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
                  onPressed: () {
                    _temp1forgotViewModel.goToEmailView();
                  },
                ),
                SpaceView(
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
                  onPressed: () => _temp1forgotViewModel.goToSmsView(),
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
                          TextSpan(style: hyperBlueTextStyle, text: "e-posta "),
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
      },
    );
  }
}
