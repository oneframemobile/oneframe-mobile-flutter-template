import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_provider/core/base/base_model.dart';
import 'package:flutter_provider/core/enum/page_named.dart';

class Temp1ForgotViewModel extends BaseModel {
  BuildContext _context;

  BuildContext get context => _context;

  @override
  void setContext(BuildContext context) {
    this._context = context;
  }

  goToSmsView() {
    navigator.navigateTo(Pages.Temp1SmsView);
  }

  goToEmailView() {
    navigator.navigateTo(Pages.Temp1EmailView);
  }
}
