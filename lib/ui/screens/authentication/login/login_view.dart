import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_provider/core/base/baseview.dart';
import 'package:flutter_provider/core/viewmodel/login_view_model.dart';
import 'package:flutter_provider/ui/shared/styles/colors/colors.dart';
import 'package:flutter_provider/ui/shared/styles/text/styles.dart';
import 'package:flutter_provider/ui/shared/widgets/button/raised_button.dart';
import 'package:flutter_provider/ui/shared/widgets/button/social_button.dart';
import 'package:flutter_provider/ui/shared/widgets/view/empty_view.dart';
import 'package:flutter_provider/ui/shared/widgets/view/nested_stack.dart';
import 'package:flutter_provider/ui/shared/widgets/view/text_form_field_view.dart';
import 'package:flutter_provider/ui/shared/widgets/view/title_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel _loginViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      onModelReady: (model) {
        _loginViewModel = model;
        _loginViewModel.setContext(context);
      },
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: NestedScrollView(
                controller: _loginViewModel.scrollController,
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: _loginViewModel.isKeyboardOpen ? ScreenUtil.instance.setHeight(0) : ScreenUtil.instance.setHeight(600),
                      floating: true,
                      pinned: true,
                      forceElevated: innerBoxIsScrolled,
                      flexibleSpace: NestedStackWidget(
                        backgroundImage: "assets/images/background.jpg",
                        childImage: "assets/images/starforce.png",
                      ),
                      backgroundColor: Colors.black,
                    ),
                  ];
                },
                body: _buildContent),
          ),
        );
      },
    );
  }

  Widget get _buildContent {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TitleWidget(
              title: "HOŞGELDİNİZ",
            ),
            Text(
              "Lorem ipsum dolor sit amet, consetetur sadipscing consetetur. Consetetur dolor sit amet, sed diam nonumy",
              style: TextStyle(fontSize: 12),
            ),
            SpaceView(height: 50),
            Column(
              children: <Widget>[
                TextFormWidget(
                  labelText: "E-Posta",
                  currentFocusNode: _loginViewModel.emailFocus,
                  nextFocusNode: _loginViewModel.passwordFocus,
                  leftIcon: Icons.email,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormWidget(
                  labelText: "Şifre",
                  obscureText: _loginViewModel.visibilityField,
                  textInputType: TextInputType.visiblePassword,
                  currentFocusNode: _loginViewModel.passwordFocus,
                  textInputAction: TextInputAction.done,
                  leftIcon: Icons.lock,
                  actionIconData: _loginViewModel.visibilityField ? Icons.visibility_off : Icons.visibility,
                  onActionCallback: () {
                    if (!_loginViewModel.isKeyboardOpen) {
                      _loginViewModel.passwordFocus.unfocus();
                      _loginViewModel.passwordFocus.canRequestFocus = false;
                    }
                    _loginViewModel.changeVisibility();
                  },
                ),
                SpaceView(height: 50),
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () => _loginViewModel.openForgotPassword(),
                    child: Text("Şifremi Unuttum", style: forgotTextStyle),
                  ),
                ),
                SpaceView(height: 30),
                ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: RaisedGradientButton(
                        height: 160,
                        child: Text(
                          'GİRİŞ',
                          style: loginButtonStyle,
                        ),
                        gradient: LinearGradient(
                          colors: loginButtonGradient,
                        ),
                        onPressed: () {
                          _loginViewModel.loginSuccess();
                        })),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Flexible(
                          flex: 2,
                          child: Divider(
                            height: 4,
                            color: underlineColor,
                          )),
                      Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            "ve ya",
                            textAlign: TextAlign.center,
                            style: forgotTextStyle,
                          )),
                      Flexible(
                          flex: 2,
                          child: Divider(
                            height: 4,
                            color: underlineColor,
                          ))
                    ],
                  ),
                ),
                SocailButtonsWidget(
                  onGooglePressed: null,
                  onFacebookPressed: null,
                  onTwitterPressed: null,
                ),
                SpaceView(height: 50),
                InkWell(
                  onTap: () {
                    _loginViewModel.openSignUpPage();
                  },
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(text: "Hesabın yok mu?", style: TextStyle(color: Colors.black, fontStyle: FontStyle.normal, fontSize: 12)),
                    TextSpan(
                        text: " Hemen Üye Ol!",
                        style: TextStyle(color: blue, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal, decoration: TextDecoration.underline, fontSize: 12)),
                  ])),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
