import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_provider/core/base/baseview.dart';
import 'package:flutter_provider/core/viewmodel/sms_view_model.dart';
import 'package:flutter_provider/ui/shared/styles/colors/colors.dart';
import 'package:flutter_provider/ui/shared/styles/input/semi_border.dart';
import 'package:flutter_provider/ui/shared/styles/text/styles.dart';
import 'package:flutter_provider/ui/shared/widgets/button/raised_button.dart';
import 'package:flutter_provider/ui/shared/widgets/view/empty_view.dart';
import 'package:flutter_provider/ui/shared/widgets/view/nested_stack.dart';
import 'package:flutter_provider/ui/shared/widgets/view/shadow_view.dart';
import 'package:flutter_provider/ui/shared/widgets/view/text_form_field_view.dart';
import 'package:flutter_provider/ui/shared/widgets/view/title_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmsView extends StatefulWidget {
  SmsView({Key key}) : super(key: key);

  _SmsViewState createState() => _SmsViewState();
}

class _SmsViewState extends State<SmsView> {
  SmsViewModel _smsViewModel;
  final double space = 80;
  String email;
  final String desc =
      "Lorem ipsum dolor sit amet, consetetursadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea";

  @override
  Widget build(BuildContext context) {
    return BaseView<SmsViewModel>(
      onModelReady: (model) {
        _smsViewModel = model;
        _smsViewModel.setContext(context);
      },
      builder: (context, model, child) {
        return buildScaffold(context);
      },
    );
  }

  Scaffold buildScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Sms ile Sifre Yenileme"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Column(
          children: <Widget>[
            TitleWidget(
              title: "Sms ile Sifre Yenileme",
              description: this.desc,
              titleStyle: titleNormalTextStyle,
            ),
            SpaceView(
              height: 200,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: TextFormWidget(
                labelText: "Telefon",
                textInputAction: TextInputAction.done,
                inputFormatters: [_smsViewModel.formatter],
              ),
            ),
            SpaceView(
              height: space,
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
                      onPressed: () {
                        _smsViewModel.navigator.pop();
                        _smsViewModel.navigator.pop();
                      })),
            ),
          ],
        ),
      ),
    );
  }
}
