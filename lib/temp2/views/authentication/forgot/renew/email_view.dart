import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_provider/core/base/baseview.dart';
import 'package:flutter_provider/core/viewmodel/email_view_model.dart';
import 'package:flutter_provider/shared/styles/colors/colors.dart';
import 'package:flutter_provider/shared/styles/text/styles.dart';
import 'package:flutter_provider/shared/widgets/button/raised_button.dart';
import 'package:flutter_provider/shared/widgets/view/empty_view.dart';
import 'package:flutter_provider/shared/widgets/view/text_form_field_view.dart';
import 'package:flutter_provider/shared/widgets/view/title_view.dart';

class EmailView extends StatefulWidget {
  EmailView({Key key}) : super(key: key);

  _EmailViewState createState() => _EmailViewState();
}

class _EmailViewState extends State<EmailView> {
  EmailViewModel _emailViewModel;
  final double space = 50;
  String email;
  final String desc =
      "Lorem ipsum dolor sit amet, consetetursadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea";

  @override
  Widget build(BuildContext context) {
    return BaseView<EmailViewModel>(
      onModelReady: (model) {
        _emailViewModel = model;
        _emailViewModel.setContext(context);
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
        title: Text("E-Posta ile Sifre Yenileme"),
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
              height: 200,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: TextFormWidget(
                labelText: "E-Posta",
                textInputType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
              ),
            ),
            SpaceView(
              height: space,
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
                      onPressed: () {
                        _emailViewModel.navigator.pop();
                        _emailViewModel.navigator.pop();
                      })),
            ),
            SpaceView(
              height: space,
            ),
          ],
        ),
      ),
    );
  }
}
