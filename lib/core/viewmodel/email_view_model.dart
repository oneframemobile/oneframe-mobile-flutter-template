import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_provider/core/base/base_model.dart';

class EmailViewModel extends BaseModel {
  BuildContext _context;

  BuildContext get context => _context;

  EmailViewModel() {

  }


  @override
  void setContext(BuildContext context) {
    this._context = context;
  }
}
