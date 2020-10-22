import 'package:flutter/material.dart';
import 'package:flutter_provider/core/base/baseview.dart';
import 'package:flutter_provider/core/enum/viewstate.dart';
import 'package:flutter_provider/core/viewmodel/temp1_register_view_model.dart';
import 'package:flutter_provider/shared/styles/colors/colors.dart';
import 'package:flutter_provider/shared/styles/input/semi_border.dart';
import 'package:flutter_provider/shared/styles/text/styles.dart';
import 'package:flutter_provider/shared/widgets/button/raised_button.dart';
import 'package:flutter_provider/shared/widgets/view/empty_view.dart';
import 'package:flutter_provider/shared/widgets/view/shadow_view.dart';

class Temp1RegisterView extends StatefulWidget {
  @override
  _Temp1RegisterViewState createState() => _Temp1RegisterViewState();
}

class _Temp1RegisterViewState extends State<Temp1RegisterView> {
  Temp1RegisterViewModel _temp1registerViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<Temp1RegisterViewModel>(
      onModelReady: (model) {
        _temp1registerViewModel = model;
        model.setContext(context);
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
            Column(
              children: <Widget>[
                ShadowWidget(
                  child: TextFormField(
                    controller: _temp1registerViewModel.nameController,
                    decoration: decoration("Ad"),
                  ),
                ),
                SpaceView(height: 20),
                ShadowWidget(
                  child: TextFormField(
                    controller: _temp1registerViewModel.surnameController,
                    decoration: decoration("Soyad"),
                  ),
                ),
                SpaceView(height: 20),
                ShadowWidget(
                  child: TextFormField(
                    controller: _temp1registerViewModel.mailController,
                    decoration: decoration("Email"),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SpaceView(
                  height: 20,
                ),
                ShadowWidget(
                  child: TextFormField(
                    controller: _temp1registerViewModel.phoneController,
                    decoration: decoration("Telefon"),
                  ),
                ),
                SpaceView(
                  height: 20,
                ),
                ShadowWidget(
                  child: TextFormField(
                    controller: _temp1registerViewModel.passwordController,
                    obscureText: _temp1registerViewModel.visibiltyField,
                    decoration: decoration("Şifre",
                        suffix: InkWell(
                          onTap: _temp1registerViewModel.changeVisibility,
                          child: Icon(
                            _temp1registerViewModel.visibiltyField ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        )),
                  ),
                ),
                SpaceView(
                  height: 20,
                ),
                RaisedGradientButton(
                  child: _temp1registerViewModel.state == ViewState.Loading
                      ? _buildLoading
                      : Text(
                          'Uye ol',
                          style: loginButtonStyle,
                        ),
                  gradient: LinearGradient(
                    colors: loginButtonGradient,
                  ),
                  onPressed: () {
                    _temp1registerViewModel.registerUser();
                  },
                ),
                SizedBox(height: 30),
              ],
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
