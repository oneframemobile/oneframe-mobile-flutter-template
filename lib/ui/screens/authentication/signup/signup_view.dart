import 'package:flutter/material.dart';
import 'package:flutter_provider/core/api/bean/request/register_request.dart';
import 'package:flutter_provider/core/base/baseview.dart';
import 'package:flutter_provider/core/viewmodel/sign_up_view_model.dart';
import 'package:flutter_provider/ui/screens/home/home_view.dart';
import 'package:flutter_provider/ui/shared/styles/colors/colors.dart';
import 'package:flutter_provider/ui/shared/styles/text/styles.dart';
import 'package:flutter_provider/ui/shared/widgets/button/raised_button.dart';
import 'package:flutter_provider/ui/shared/widgets/view/empty_view.dart';
import 'package:flutter_provider/ui/shared/widgets/view/nested_stack.dart';
import 'package:flutter_provider/ui/shared/widgets/view/text_form_field_view.dart';
import 'package:flutter_provider/ui/shared/widgets/view/title_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  SignUpViewModel _signUpViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
      onModelReady: (model) {
        _signUpViewModel = model;
        _signUpViewModel.setContext(context);
      },
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            key: _signUpViewModel.signupKey,
            resizeToAvoidBottomInset: true,
            body: NestedScrollView(
                //controller: _signUpViewModel.scrollController,
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: _signUpViewModel.isKeyboardOpen ? ScreenUtil.instance.setHeight(0) : ScreenUtil.instance.setHeight(600),
                      floating: true,
                      pinned: true,
                      forceElevated: innerBoxIsScrolled,
                      flexibleSpace: _signUpViewModel.isKeyboardOpen
                          ? Container(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 56),
                                    child: Text(
                                      "Üye Ol",
                                      style: TextStyle(color: Colors.white, fontSize: 16),
                                    ),
                                  )),
                            )
                          : NestedStackWidget(
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
              title: "Üye Ol",
            ),
            TextFormWidget(
              labelText: "Ad",
              textEditingController: _signUpViewModel.nameController,
              currentFocusNode: _signUpViewModel.nameFocus,
              nextFocusNode: _signUpViewModel.surnameFocus,
              textInputType: TextInputType.name,
            ),
            SpaceView(height: 40),
            TextFormWidget(
              labelText: "Soyad",
              textEditingController: _signUpViewModel.surnameController,
              currentFocusNode: _signUpViewModel.surnameFocus,
              nextFocusNode: _signUpViewModel.emailFocus,
              textInputType: TextInputType.name,
            ),
            SpaceView(height: 40),
            TextFormWidget(
              labelText: "E-Posta",
              textEditingController: _signUpViewModel.mailController,
              currentFocusNode: _signUpViewModel.emailFocus,
              nextFocusNode: _signUpViewModel.phoneFocus,
              textInputType: TextInputType.emailAddress,
            ),
            SpaceView(
              height: 40,
            ),
            TextFormWidget(
              labelText: "Telefon",
              textEditingController: _signUpViewModel.phoneController,
              currentFocusNode: _signUpViewModel.phoneFocus,
              nextFocusNode: _signUpViewModel.passwordFocus,
              textInputType: TextInputType.phone,
              inputFormatters: [_signUpViewModel.formatter],
            ),
            SpaceView(
              height: 40,
            ),
            TextFormWidget(
              textEditingController: _signUpViewModel.passwordController,
              labelText: "Şifre",
              obscureText: _signUpViewModel.visibilityField,
              textInputType: TextInputType.visiblePassword,
              currentFocusNode: _signUpViewModel.passwordFocus,
              textInputAction: TextInputAction.done,
              actionIconData: _signUpViewModel.visibilityField ? Icons.visibility_off : Icons.visibility,
              onActionCallback: () {
                if (!_signUpViewModel.isKeyboardOpen) {
                  _signUpViewModel.passwordFocus.unfocus();
                  _signUpViewModel.passwordFocus.canRequestFocus = false;
                }
                _signUpViewModel.changeVisibility();
              },
            ),
            SpaceView(
              height: 120,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: RaisedGradientButton(
                  height: 160,
                  child: Text(
                    'ÜYE OL',
                    style: loginButtonStyle,
                  ),
                  gradient: LinearGradient(
                    colors: loginButtonGradient,
                  ),
                  onPressed: () {
                    _signUpViewModel.registerUser();
                  },
                )),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
