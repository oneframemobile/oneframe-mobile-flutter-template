import 'package:flutter/material.dart';
import 'package:flutter_provider/core/base/base_model.dart';
import 'package:flutter_provider/core/enum/page_named.dart';

class SplashViewModel extends BaseModel {
  BuildContext _context;

  BuildContext get context => _context;


  @override
  void setContext(BuildContext context) {
    this._context = context;

    Future.delayed(Duration(seconds: 2),(){
      navigator.navigateToRemove(Pages.Login);
    });
  }
}
