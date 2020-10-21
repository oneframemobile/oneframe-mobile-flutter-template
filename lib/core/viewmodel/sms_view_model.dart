import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_provider/core/base/base_model.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SmsViewModel extends BaseModel {
  BuildContext _context;

  BuildContext get context => _context;

  MaskTextInputFormatter formatter;


  SmsViewModel() {
    formatter = new MaskTextInputFormatter(mask: '(###) ### ## ##', filter: {"#": RegExp(r'[0-9]')});
  }


  @override
  void setContext(BuildContext context) {
    this._context = context;
  }
}
