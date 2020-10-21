import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_provider/core/base/base_model.dart';
import 'package:flutter_provider/core/enum/page_named.dart';
import 'package:url_launcher/url_launcher.dart';

class ForgotPasswordViewModel extends BaseModel {
  BuildContext _context;

  BuildContext get context => _context;

  ForgotPasswordViewModel() {

  }


  @override
  void setContext(BuildContext context) {
    this._context = context;
  }

  goEmailView(){
    navigator.navigateTo(Pages.EmailView);
  }

  goSmsView(){
    navigator.navigateTo(Pages.SmsView);
  }

  sendMail() async {
    String url = "mailto:starforce@starforce.com";
    if (await canLaunch(url)) {
      await launch(url);
    } else {

    }
  }
}
