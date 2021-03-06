import 'package:flutter/material.dart';
import 'package:flutter_provider/core/base/base_model.dart';
import 'package:flutter_provider/core/enum/page_named.dart';
import 'package:flutter_provider/shared/keyboard.dart';

class SplashViewModel extends BaseModel {
  BuildContext _context;

  BuildContext get context => _context;

  @override
  void setContext(BuildContext context) {
    this._context = context;

    KeyboardChangeNotifier.hideKeyboard();
    Future.delayed(Duration(seconds: 2), () {
      //navigator.navigateToRemove(Pages.Home);
      navigator.navigateToRemove(Pages.SelectTempView);
    });
  }
}
