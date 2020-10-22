import 'package:flutter/material.dart';
import 'package:flutter_provider/core/base/base_model.dart';
import 'package:flutter_provider/core/enum/page_named.dart';

class SelectTempViewModel extends BaseModel {
  BuildContext _context;

  BuildContext get context => _context;


  @override
  void setContext(BuildContext context) {
    this._context = context;


  }

  goToLoginTemp1(){
    navigator.navigateTo(Pages.Temp1AuthView);
  }


  goToLoginTemp2(){
    navigator.navigateTo(Pages.Login);
  }
}
