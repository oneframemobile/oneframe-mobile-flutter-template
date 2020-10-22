import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_provider/core/base/baseview.dart';
import 'package:flutter_provider/core/viewmodel/temp1_sms_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_provider/shared/styles/colors/colors.dart';
import 'package:flutter_provider/shared/styles/input/semi_border.dart';
import 'package:flutter_provider/shared/styles/text/styles.dart';
import 'package:flutter_provider/shared/widgets/button/raised_button.dart';
import 'package:flutter_provider/shared/widgets/view/empty_view.dart';
import 'package:flutter_provider/shared/widgets/view/nested_stack.dart';
import 'package:flutter_provider/shared/widgets/view/shadow_view.dart';
import 'package:flutter_provider/shared/widgets/view/title_view.dart';

class Temp1SmsView extends StatefulWidget {
  @override
  _Temp1SmsViewState createState() => _Temp1SmsViewState();
}

class _Temp1SmsViewState extends State<Temp1SmsView> {
  final double space = 80;
  Temp1SmsViewModel _temp1smsViewModel;
  final String desc =
      "Lorem ipsum dolor sit amet, consetetursadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea";

  @override
  Widget build(BuildContext context) {
    return BaseView<Temp1SmsViewModel>(
      onModelReady: (model) {
        _temp1smsViewModel = model;
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
          body: SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                TitleWidget(
                  title: "Telefon ile Sifre Yenileme",
                  description: this.desc,
                  titleStyle: titleNormalTextStyle,
                ),
                SpaceView(
                  height: space,
                ),
                Form(
                  child: ShadowWidget(
                    child: TextFormField(
                      decoration: decoration(
                        "Telefon",
                      ),
                    ),
                  ),
                ),
                SpaceView(
                  height: space,
                ),
                RaisedGradientButton(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'SMS Gonder',
                    style: loginButtonStyle,
                  ),
                  gradient: LinearGradient(
                    colors: forgotSMSButtonGradient,
                  ),
                  rightIcon: Icons.chat_bubble_outline,
                  onPressed: () {
                    print('Welcome');
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
