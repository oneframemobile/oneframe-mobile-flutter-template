import 'package:flutter/material.dart';
import 'package:flutter_provider/core/base/base_model.dart';
import 'package:flutter_provider/core/enum/page_named.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class Temp1AuthViewModel extends BaseModel {
  BuildContext _context;

  BuildContext get context => _context;

  @override
  void setContext(BuildContext context) {
    this._context = context;
  }
}
