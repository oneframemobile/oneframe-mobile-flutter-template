import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_provider/core/base/baseview.dart';
import 'package:flutter_provider/core/enum/viewstate.dart';
import 'package:flutter_provider/core/viewmodel/temp1_login_view_model.dart';
import 'package:flutter_provider/shared/styles/colors/colors.dart';
import 'package:flutter_provider/shared/styles/input/semi_border.dart';
import 'package:flutter_provider/shared/styles/text/styles.dart';
import 'package:flutter_provider/shared/validator/login_input_validator.dart';
import 'package:flutter_provider/shared/widgets/button/raised_button.dart';
import 'package:flutter_provider/shared/widgets/button/social_button.dart';
import 'package:flutter_provider/shared/widgets/view/empty_view.dart';
import 'package:flutter_provider/shared/widgets/view/shadow_view.dart';
import 'package:flutter_provider/shared/widgets/view/title_view.dart';

class Temp1LoginView extends StatefulWidget {
  Temp1LoginView({Key key}) : super(key: key);

  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<Temp1LoginView> {
  Temp1LoginViewModel _loginViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<Temp1LoginViewModel>(
      onModelReady: (model) {
        _loginViewModel = model;
        _loginViewModel.setContext(context);
      },
      builder: (context, model, child) {
        return SafeArea(
          child: _buildContent(),
        );
      },
    );
  }

  Widget _buildContent() {
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
            Form(
              key: _loginViewModel.loginFormKey,
              child: Column(
                children: <Widget>[
                  ShadowWidget(
                    child: TextFormField(
                      controller: _loginViewModel.emailController,
                      decoration: decoration("E-Posta"),
                      validator: ValidatorHelper.emptyControl,
                    ),
                  ),
                  SpaceView(height: 50),
                  ShadowWidget(
                    child: TextFormField(
                        obscureText: _loginViewModel.visibiltyField,
                        controller: _loginViewModel.passwordController,
                        decoration: decoration(
                          "Şifre",
                          suffix: InkWell(
                            onTap: () {
                              _loginViewModel.changeVisibility();
                            },
                            child: Icon(
                              _loginViewModel.visibiltyField ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        validator: ValidatorHelper.emptyControl),
                  ),
                  SpaceView(height: 50),
                  RaisedGradientButton(
                      child: _loginViewModel.state == ViewState.Loading
                          ? _buildLoading
                          : Text(
                              'GİRİŞ',
                              style: loginButtonStyle,
                            ),
                      gradient: LinearGradient(
                        colors: loginButtonGradient,
                      ),
                      onPressed: () {
                        _loginViewModel.loginUser();
                      }),
                  SpaceView(height: 30),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {
                        _loginViewModel.goToForgotView();
                      },
                      child: Text("Şifremi Unuttum", style: forgotTextStyle),
                    ),
                  ),
                  SpaceView(height: 50),
                  Row(
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
                            "veya",
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
                  SpaceView(height: 30),
                  SocailButtonsWidget(
                    onGooglePressed: null,
                    onFacebookPressed: null,
                    onTwitterPressed: null,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _buildLoading {
    return Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }
}
