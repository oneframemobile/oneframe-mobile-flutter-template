import 'package:flutter/material.dart';
import 'package:flutter_provider/core/base/base_model.dart';
import 'package:flutter_provider/core/enum/page_named.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class AuthenticationViewModel extends BaseModel {
  BuildContext _context;

  BuildContext get context => _context;

  bool floating = false;
  ScrollController scrollController;
  TabController tabController;

  @override
  void setContext(BuildContext context) {
    this._context = context;

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        scrollController.animateTo(visible ? ScreenUtil.instance.setHeight(600) : scrollController.position.minScrollExtent,
            curve: Curves.easeIn, duration: Duration(milliseconds: 500));
      },
    );
  }
}
