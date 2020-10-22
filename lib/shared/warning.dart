import 'package:flutter/material.dart';

class WarningDialog {
  static Future<SnackBarClosedReason> showSnackBar({@required GlobalKey<ScaffoldState> key, Widget child, bool isFixed = true, SnackBarAction action, int duration = 2}) {
    key.currentState.hideCurrentSnackBar();
    return key.currentState
        .showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          content: child,
          duration: Duration(seconds: duration),
          action: action,
        ))
        .closed;
  }
}
