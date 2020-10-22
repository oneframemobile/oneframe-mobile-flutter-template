import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_provider/core/base/baseview.dart';
import 'package:flutter_provider/core/viewmodel/temp1_email_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_provider/shared/styles/colors/colors.dart';
import 'package:flutter_provider/shared/styles/input/semi_border.dart';
import 'package:flutter_provider/shared/styles/text/styles.dart';
import 'package:flutter_provider/shared/widgets/button/raised_button.dart';
import 'package:flutter_provider/shared/widgets/view/empty_view.dart';
import 'package:flutter_provider/shared/widgets/view/nested_stack.dart';
import 'package:flutter_provider/shared/widgets/view/shadow_view.dart';
import 'package:flutter_provider/shared/widgets/view/title_view.dart';

class Temp1EmailView extends StatefulWidget {
  @override
  _Temp1EmailViewState createState() => _Temp1EmailViewState();
}

class _Temp1EmailViewState extends State<Temp1EmailView> {
  final String desc =
      "Lorem ipsum dolor sit amet, consetetursadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea";

  Temp1EmailViewModel _temp1emailViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<Temp1EmailViewModel>(
      onModelReady: (model) {
        _temp1emailViewModel = model;
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
                  title: "E-Posta ile Sifre Yenileme",
                  description: this.desc,
                  titleStyle: titleNormalTextStyle,
                ),
                SpaceView(
                  height: 80,
                ),
                Form(
                  child: ShadowWidget(
                    child: TextFormField(
                      decoration: decoration(
                        "E-Posta",
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ),
                SpaceView(
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
                SpaceView(
                  height: 80,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
